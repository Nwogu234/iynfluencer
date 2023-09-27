import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/jobs_my_bids_influencer_model.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/models/listmediainflue_item_model.dart';

/// A controller class for the JobsMyBidsInfluencerPage.
///
/// This class manages the state of the JobsMyBidsInfluencerPage, including the
/// current jobsMyBidsInfluencerModelObj
class JobsMyBidsInfluencerController extends GetxController {
  JobsMyBidsInfluencerController();

  late RxList<JobsMyBidsInfluencerModel> jobsMyBidsInfluencerModelObj =
      <JobsMyBidsInfluencerModel>[].obs;

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;

  List<JobsMyBidsInfluencerModel> existingJobs = []; // Existing jobs
  // RxList<JobsMyBidsInfluencerModel> newJobs =
  //     <JobsMyBidsInfluencerModel>[].obs; // new jobs
  // TextEditingController searchController = TextEditingController();

//this is for animation
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
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
        getInfluencerJobBids().then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

// List<JobsMyBidsInfluencerModel>
  Future<void> getInfluencerJobBids() async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response = await apiClient.getInfluencerJobsBids(token);
      List<dynamic> jobJsonList = response.body['data']['docs'];
      print('=====jobJsonList length====');
      print(jobJsonList.length);
      if (jobJsonList.length > 0) {
        jobJsonList.forEach((e) {
          existingJobs.add(JobsMyBidsInfluencerModel.fromJson(e));
        });
      }
      if (existingJobs.isEmpty) {
        error('');
        isTrendLoading.value = false;
      } else {
        jobsMyBidsInfluencerModelObj.value = existingJobs;
        error('');
        isTrendLoading.value = false;
      }
      isTrendLoading.value = false;
    } catch (e) {
      print(e);
      // Get.snackbar('Error', 'Something went wrong');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }

  // Future<void> getNewJob(Job newJob) async {
  //   isRecommendedLoading.value = true;
  //   try {
  //     error('');
  //     final response = await apiClient.createJob(newJob, token);

  //     if (response.isOk) {
  //       // If the job creation is successful, add it to the list of trendingJobs
  //       final createdJob = Job.fromJson(response.body['data']);
  //       existingJobs.insert(0, createdJob); // Add the new job at the beginning
  //     } else {
  //       throw Exception(
  //           'Failed to create a new job. Server error: ${response.statusText}');
  //     }
  //   } catch (e) {
  //     error('Something went wrong');
  //     print(e);
  //     isRecommendedLoading.value = false;
  //   }
  // }

  @override
  void onInit() {
    print('OnInit called');
    getUser();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // searchController.dispose();
  }
}
