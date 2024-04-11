import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/models/search_influncers_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SearchInfluncersScreen.
///
/// This class manages the state of the SearchInfluncersScreen, including the
/// current searchInfluncersModelObj
class SearchInfluncersController extends GetxController {
  SearchInfluncersController(this.searchInfluncersModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<SearchInfluncersModel> searchInfluncersModelObj;

  List<Influencer> trendingInfluencers = [];

  Rx<bool> isTrendLoading = false.obs;

  final storage = new FlutterSecureStorage();

  var token;

  final apiClient = ApiClient();

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;

  var error = ''.obs;

  RxString avatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

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

  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
