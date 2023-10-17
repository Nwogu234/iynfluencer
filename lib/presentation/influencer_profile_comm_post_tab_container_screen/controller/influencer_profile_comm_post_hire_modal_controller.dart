import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/models/influencer_profile_comm_post_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InfluencerProfileCommPostTabContainerScreen.
///
/// This class manages the state of the InfluencerProfileCommPostTabContainerScreen, including the
/// current influencerProfileCommPostTabContainerModelObj
class InfluencerProfileCommHireModalContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<Influencer?> influencerProfileCommPostTabContainerModelObj =
      Rx<Influencer?>(null);
  InfluencerProfileCommHireModalContainerController();

  RxList<Job> jobsForHire = <Job>[].obs;
  Rx<String> selectedJob = ''.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRequestLoading = false.obs;
  Rx<bool> isError = false.obs;
  List<Job> previousJobs = []; // Existing jobs

  final storage = new FlutterSecureStorage();
  final UserController user = Get.find();

  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  var theNum = 5.obs;

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
        // getInfluencerJobJobs(user.userModelObj.value.influencerId!)
        //     .then((value) {
        //   isLoading.value = false;
        // }).catchError((err) {
        //   isLoading.value = false;
        // });
        getUnHiredJobs().then((value) {
          isLoading.value = false;
        }).catchError((er) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  void setSelectedInfluencer(Influencer listrectangle50) {
    influencerProfileCommPostTabContainerModelObj.value = listrectangle50;
  }

  Future<void> getUnHiredJobs() async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response = await apiClient.getAllCreatorJobs(token);
      List<dynamic> dd = response.body['data']['docs'];
      dd.forEach((element) {
        if (element['hired'] == false) {
          previousJobs.add(Job.fromJson(element));
        }
      });
      if (previousJobs.isEmpty) {
        error('Something went wrong');
        isTrendLoading.value = false;
      } else {
        jobsForHire.value = previousJobs;
        error('');
        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }

  Future<void> sendJobRequest(String jobId, String influencerId) async {
    Response response = Response();
    try {
      isRequestLoading.value = true;
      error('');
      response = await apiClient.sendJobRequestService(
          new SendJobRequest(influencerId: influencerId, jobId: jobId), token);

      if (response.body) {
        isRequestLoading.value = false;
        // Get.toNamed(
        //   AppRoutes.logInScreen,
        // );
        selectedJob.value = '';
        getUnHiredJobs();
      }
    } catch (e) {
      isRequestLoading.value = false;
      print(response.toString());
      Get.snackbar('Error', 'Error Sending Job Request');
      error('Something went wrong');
    }
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onClose() {
    jobsForHire.value = [];
    super.onClose();
    // searchController.dispose();
  }
}
