import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../widgets/staggerd_widget.dart';

/// A controller class for the HomeCreatorPage.
///
/// This class manages the state of the HomeCreatorPage, including the
/// current homeCreatorModelObj
class HomeCreatorController extends GetxController {
  HomeCreatorController(this.homeCreatorModelObj);
  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<Widget> tiles =[];
  var usePlaceholder = false.obs;
  RxString avatar = ''.obs;
  List<Influencer> trendingInfluencers = [];
  RxList<Influencer> recommendedInfluencers = <Influencer>[].obs;
  TextEditingController searchController = TextEditingController();
  RxString? updatedName = ''.obs;
  Rx<File?> updatedProfileImage = Rx<File?>(null);
  Rx<HomeCreatorModel> homeCreatorModelObj;

/* 
//this is for animation
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }
 */


  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
   
  }

  Future<void> loadRecommendedInfluencers() async {
  try {
    await Future.delayed(Duration(seconds: 1));
    
    recommendedInfluencers.addAll(List.generate(10, (index) => Influencer()));
  } catch (e) {
    error.value = e.toString();
  } finally {
    isLoading.value = false;
  }
}
  List<Widget> generateTiles(List<Influencer> influencers) {

    return List<Widget>.generate(influencers.length, (index) {
      EdgeInsetsGeometry padding = index % 2 == 0 ?
      EdgeInsets.all(0):
      EdgeInsets.only(top: 0);

      Widget card = Padding(
        padding: padding,
        child: StaggeredWidget(user: influencers[index]),
      );  // Your custom widget

      // Apply different margins or padding based on the index for visual effect


      return StaggeredGridTile.count(
        crossAxisCellCount: 1, // Same width for all tiles
        mainAxisCellCount: index % 2 == 0 ? 1.2:1,  // Same height for all tiles
        child: card,
      );
    });
  }




//*animation stops here
  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        print(user.userModelObj.value.avatar);
        isLoading.value = false;
        avatar.value = user.userModelObj.value.avatar;
        getInfluencers();

        getRecommended();
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  void getInfluencers() async {
    try {
      error('');
      isTrendLoading.value = true;
      trendingInfluencers = await apiClient.getInfluencers(1, 15, token);
      if (trendingInfluencers.isEmpty) {
        error('Something went wrong');
        isTrendLoading.value = false;
      } else {
        error('');
        tiles=generateTiles(trendingInfluencers);
        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  void getRecommended() async {
    isRecommendedLoading.value = true;
    try {
      error('');
      recommendedInfluencers.value =
          await apiClient.getInfluencers(1, 25, token);
      if (recommendedInfluencers.isEmpty) {
        error('Something went wrong');
        isRecommendedLoading.value = false;
      } else {
        error('');
        isRecommendedLoading.value = false;
      }
    } catch (e) {
      error('Something went wrong');
      print(e);
      isRecommendedLoading.value = false;
    }
  }

  // Function to update profile data
  void updateProfileData(Map<String, dynamic>? data) {
    if (data != null) {
      updatedName?.value = data['profileDetails']['firstName'] +
          ' ' +
          data['profileDetails']['lastName'];
      updatedProfileImage.value = File(data['profileImagePath']);
    }
  }

  @override
  void onInit() {
    print('OnInit called');
    getUser();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
