import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/influencer_fashion_home_screen/model/influencer_fashion_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/general_controllers/user_controller.dart';
import '../../../data/models/Influencer/influencer_response_model.dart';

/// A controller class for the InfluencerHomeScreen.
///
/// This class manages the state of the InfluencerHomeScreen, including the
/// current influencerHomeModelObj
class InfluencerFashionController extends GetxController {
  InfluencerFashionController(this.influencerHomeModelObj);

  final UserController user = Get.find();

  TextEditingController searchController = TextEditingController();

  Rx<InfluencerFashionModel> influencerHomeModelObj = InfluencerFashionModel().obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  Rx<bool> isLoading = false.obs;
  var error = ''.obs;
  Rx<bool> isJobsLoading = false.obs;
  List<Jobz> jobsList = <Jobz>[].obs;
  List<Jobz> infJobsList = <Jobz>[].obs;

  RxString? updatedName = ''.obs;
  Rx<File?> updatedProfileImage = Rx<File?>(null);


  // this is to get user when the jobs page is loaded
  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    print(token);
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        isLoading.value = false;
        getJobs(user);
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  getJobs(UserController user) async {
  Response response;
  try {
    error('');
    isJobsLoading.value = true;
    response = await apiClient.getAllJobs(1, 20, token);
    print(response.body);
    if (response.isOk) {
      final responseJson = response.body;
      final jobResponse = JobResponsez.fromJson(responseJson);
      jobsList = jobResponse.data.docs!;

      // Filter jobs based on the fashion niche and creatorId
      infJobsList = jobsList.where((job) => 
        job.category!.contains('Fashion & Style') && 
        job.creatorId != user.userModelObj.value.creatorId
      ).toList();

      print(infJobsList); 
      error('');
      isJobsLoading.value = false;
      if (infJobsList.isEmpty) {
        error('No jobs found for the fashion niche.');
      } else {
        print('Jobs found for the fashion niche:');
        print(infJobsList);
      }
    } else {
      error('Something went wrong');
      isJobsLoading.value = false;
    }
  } catch (e) {
    print(e);
    error('Something went wrong');
    isJobsLoading.value = false;
  }
}

  void onSearchSubmitted(String query) {
    print("Submitted query: $query");
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
    super.onInit();
    print('OnInit called');
    getUser();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  
  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
   
  }

}


 
