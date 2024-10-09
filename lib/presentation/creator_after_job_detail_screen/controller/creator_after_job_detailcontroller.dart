import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
  final notificationClient = NotificationClient();
  final NotificationService notificationService = Get.find();
  HomeCreatorContainerController homcont =
      Get.put(HomeCreatorContainerController());
  BottomBarController bumcont = Get.put(BottomBarController());

  // Method to set the selected job
  void setSelectedJob(Job selectedJob) {
    jobDetailsModelObj.value = selectedJob;
  }

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
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
    final JobBids? data = bidsArguments.jobBid;
    final userId = data?.influencer?.userId ?? '';
    final Job job = bidsArguments.job;
    final jobTitle = job.title;
    final names =
        "${capitalizeFirstLetter(job.user?.firstName ?? '')} ${capitalizeFirstLetter(job.user?.lastName ?? '')}";
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
      await OneSignal.login(userId);
      if (jobTitle != null) {
        try {
          print('Sending notification to recipient');
          await notificationClient.sendNotification(
            'Job update: $jobTitle',
            '$names has hired you', 
             userId, 
             null
            );

          await notificationService.createNotification(
             'Job update: $jobTitle',
             '$names', 
            'Hire',
             ImageConstant.logo
          );
          print('Notification sent and saved to Firestore');
        } catch (e) {
          print('Error sending notification: $e');
        }
      } else {
        print('name is null');
      }
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
