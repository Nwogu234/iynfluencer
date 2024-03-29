import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

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
  var usePlaceholder = false.obs;
  RxString avatar = ''.obs;
  List<Influencer> trendingInfluencers = [];
  RxList<Influencer> recommendedInfluencers = <Influencer>[].obs;
  TextEditingController searchController = TextEditingController();
  RxString? updatedName = ''.obs;
  Rx<File?> updatedProfileImage = Rx<File?>(null);
  Rx<HomeCreatorModel> homeCreatorModelObj;

//this is for animation
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }

  Future<void> refreshItems() async {
    getUser();
    // Your refresh logic here
    // For example, fetching data from an API and updating 'items'
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
