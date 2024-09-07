import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/bids_screen/models/bids_model.dart';

/// A controller class for the BidsScreen.
///
/// This class manages the state of the BidsScreen, including the
/// current bidsModelObj
class BidsController extends GetxController {
  Rx<BidsModel> bidsModelObj = BidsModel().obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isError = false.obs;
  var error = ''.obs;

  final UserController user = Get.find();

  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  List<JobBids> allJobBids = <JobBids>[].obs;

  getUser(String? id) async {
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
        getAllJobsBids(id!);
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  //this is to get the list of jobs
  getAllJobsBids(String jobId) async {
    Response response;
    try {
      error('');
      isLoading.value = true;
      response = await apiClient.getAllBidsForAJob(jobId, token);
      if (response.isOk) {
        final responseJson = response.body;
        List<dynamic> dd = responseJson['data']['docs'];
        print(dd);

        print('response.isOk');
        if (dd.length > 0) {
          dd.forEach((e) {
            allJobBids.add(JobBids.fromJson(e));
            print('jobBids: $allJobBids');
          });
        }
        if (allJobBids.isEmpty) {
          error('No Job Bids');
        }
        // List of Influencers

        isLoading.value = false;
      } else {
        error('Something went wrong');
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isError.value = true;
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  onDeleteBids(String bidId) async {
    Get.dialog(
      Center(
          child: CircularProgressIndicator(
        color: ColorConstant.cyan100,
      )),
      barrierDismissible: false,
    );
    try {
      token = await storage.read(key: "token");
      isLoading.value = true;
      Response response = await apiClient.deleteBid(bidId, token);

      Get.back();
      if (response.isOk) {
        Get.back();
        Get.snackbar('Success', 'Bid dismissed successfully');
      } else {
        Get.snackbar('Error', 'Failed to dismiss the bid');
      }
    } catch (e) {
      // Close the dialog and show an error message if the request fails
      Get.back();
      Get.snackbar('Error', 'Something went wrong: $e');
    }
  }

/* 
getAllJobsBids(String jobId) async {
  Response response;
  try {
    error('');
    isLoading.value = true;
    response = await apiClient.getAllBidsForAJob(jobId, token);
    if (response.isOk) {
      final responseJson = response.body;
      print('Full Response: $responseJson'); // Debugging: Print the full response

      // Ensure 'data' is a Map and 'docs' is a List
      if (responseJson['data'] is Map<String, dynamic> && responseJson['data']['docs'] is List) {
        List<dynamic> docs = responseJson['data']['docs'];
        print('Docs List: $docs'); // Debugging: Print the docs list

        if (docs.isNotEmpty) {
          docs.forEach((e) {
            allJobBids.add(JobBids.fromJson(e));
            print('jobBids: $allJobBids');
          });
        } else {
          error('No Job Bids');
        }
      } else {
        error('Unexpected response format');
        print('Data or Docs format issue'); // Debugging: Indicate data/docs format issue
      }

      isLoading.value = false;
    } else {
      error('Something went wrong');
      isLoading.value = false;
    }
  } catch (e) {
    print('Exception: $e'); // Debugging: Print the exception
    isError.value = true;
    error('Something went wrong');
    isLoading.value = false;
  }
} */

  @override
  void onInit() {
    print('OnInit called');
    final Job selectedJob = Get.arguments as Job;
    getUser(selectedJob.jobId);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // searchController.dispose();
    // animationController.dispose();
  }
}
