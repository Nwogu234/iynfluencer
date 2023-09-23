import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/general_controllers/user_controller.dart';

/// A controller class for the InfluencerHomeScreen.
///
/// This class manages the state of the InfluencerHomeScreen, including the
/// current influencerHomeModelObj
class InfluencerHomeController extends GetxController {
  InfluencerHomeController(this.influencerHomeModelObj);

  final UserController user = Get.find();

  TextEditingController searchController = TextEditingController();

  Rx<InfluencerHomeModel> influencerHomeModelObj = InfluencerHomeModel().obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  Rx<bool> isLoading = false.obs;
  var error = ''.obs;
  Rx<bool> isJobsLoading = false.obs;
  List<Job> jobsList = <Job>[].obs;

  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }

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
        getJobs();
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  //this is to get the list of jobs
  getJobs() async {
    Response response;
    try {
      error('');
      isJobsLoading.value = true;
      response = await apiClient.getAllJobs(1, 25, token);
      print(response.body);
      if (response.isOk) {
        final responseJson = response.body;
        final jobResponse = JobResponse.fromJson(responseJson);
        jobsList = jobResponse.data.docs;
        print(jobsList); // List of Influencers
        error('');
        isJobsLoading.value = false;
      } else {
        error('Something went wrong');
        isJobsLoading.value = false;
      }
    } catch (e) {
      print(e);
      print(jobsList);
      error('Something went wrong');
      isJobsLoading.value = false;
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
