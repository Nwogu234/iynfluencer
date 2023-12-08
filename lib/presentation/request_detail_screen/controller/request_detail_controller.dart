import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/jobs_requests_influencer_page/controller/jobs_requests_influencer_controller.dart';
import 'package:iynfluencer/presentation/request_detail_screen/models/request_detail_model.dart';

/// A controller class for the RequestDetailScreen.
///
/// This class manages the state of the RequestDetailScreen, including the
/// current requestDetailModelObj
class RequestDetailController extends GetxController {
  Rx<RequestDetailModel> requestDetailModelObj = RequestDetailModel().obs;
  final UserController user = Get.find();
  final JobsRequestsInfluencerController jobRequestController =
      Get.find<JobsRequestsInfluencerController>();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;

  getUser() async {
    isLoading.value = true;
    error('');

    try {
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

// List<JobsMyBidsInfluencerModel>
  Future<void> declineRequest(String id, close) async {
    isLoading.value = true;
    close!.pop();
    try {
      var tk = await storage.read(key: "token");
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        // error('');

        // isTrendLoading.value = true;
        Response response =
            await apiClient.InfluencerDeclineJobsRequests(tk, id);
        if (response.statusCode == 201 ||
            response.body['status'] == 'SUCCESS') {
          isLoading.value = false;
          Get.snackbar('Success', 'Job Request Declined Successfully');
          Get.toNamed('jobs_requests_influencer_page');
          // jobRequestController.getUser();

          return response.body;
        }
        // isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', 'Something went wrong');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
