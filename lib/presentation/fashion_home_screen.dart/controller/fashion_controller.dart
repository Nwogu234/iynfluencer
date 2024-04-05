import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/model/fashion_home_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the HomeCreatorPage.
///
/// This class manages the state of the HomeCreatorPage, including the
/// current homeCreatorModelObj
class FashionHomeController extends GetxController {
  FashionHomeController(this.homeCreatorModelObj);
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
  Rx<FashionHomeModel> homeCreatorModelObj;

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
      List<Influencer> allInfluencers =
          await apiClient.getInfluencers(1, 15, token);
      // Filter influencers with the fashion niche
      trendingInfluencers = allInfluencers
          .where((influencer) => influencer.niche!.contains("Fashion & Style"))
          .toList();
      if (trendingInfluencers.isEmpty) {
        error('No influencers found for the fashion niche');
      } else {
        error('');
        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
    } finally {
      isTrendLoading.value = false;
    }
  }

  void getRecommended() async {
    isRecommendedLoading.value = true;
    try {
      error('');
      List<Influencer> allInfluencers =
          await apiClient.getInfluencers(1, 25, token);
      // Filter recommended influencers with the fashion niche
      recommendedInfluencers.value = allInfluencers
          .where((influencer) => influencer.niche!.contains("Fashion & Style"))
          .toList();
      if (recommendedInfluencers.isEmpty) {
        error('No recommended influencers found for the fashion niche');
      } else {
        error('');
        isRecommendedLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
    } finally {
      isRecommendedLoading.value = false;
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
