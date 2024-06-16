import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

/// A controller class for the JobDetailsScreen.
///
/// This class manages the state of the JobDetailsScreen, including the
/// current jobDetailsModelObj
class CreatorAfterJobDetailsController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  var token;
  var error = ''.obs;
  Rx<Job?> jobDetailsModelObj = Rx<Job?>(null);
  final apiClient = ApiClient();
  final storage = new FlutterSecureStorage();
  Rx<bool> isError = false.obs;
  HomeCreatorContainerController homcont =
      Get.put(HomeCreatorContainerController());
  BottomBarController bumcont = Get.put(BottomBarController());

  // Method to set the selected job
  void setSelectedJob(Job selectedJob) {
    jobDetailsModelObj.value = selectedJob;
  }

//this is for animation
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }

  Future<void> hireInfluencerFunc(
      String bidId, BidsArguments bidsArguments) async {
    var token = await storage.read(key: "token");
    Response response = Response();
    try {
      error('');
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      response = await apiClient.hireInfluencerForAJob(bidId, token);
      if (response.isOk) {
        if (response.body['status'] == 'SUCCESS') {
          Get.snackbar('Success', 'Influencer Hired');
          print('Success : Influencer Hired');
        }
      }
      homcont.currentRoute.value = AppRoutes.creatorHireslistTabContainerPage;
      Navigator.of(Get.nestedKey(1)!.currentState!.context)
          .pushReplacementNamed(AppRoutes.creatorHireslistTabContainerPage);
      bumcont.selectedIndex.value = 1;
      isTrendLoading.value = false;
    } catch (err) {
      print('-----trying something---');
      print(err);
      Get.back();
      Get.snackbar('Error', 'Server error, Check your connection');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }
}
