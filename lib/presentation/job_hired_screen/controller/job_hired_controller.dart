import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class JobHiredController extends GetxController {
  Rx<Job?> jobDetailsModelObj = Rx<Job?>(null);
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  var token;
  var error = ''.obs;
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

  Future<void> completeJobFunc(
      BuildContext context, String jobId, Job? selectedJob) async {
    var token = await storage.read(key: "token");
    final userId = selectedJob?.creator?.first.userId ?? '';
    final jobTitle = selectedJob?.title ?? '';
    final names =
        "${capitalizeFirstLetter(selectedJob?.user?.firstName ?? '')} ${capitalizeFirstLetter(selectedJob?.user?.lastName ?? '')}";
    Response response = Response();
    try {
      error('');
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      response = await apiClient.completeAJob(jobId, token);

      if (response.isOk && response.body['status'] == 'SUCCESS') {
        Get.back();
        Get.snackbar('Success', 'Job completed');
        print('Success: Job completed');
        Get.toNamed(AppRoutes.jobAcceptedScreen, parameters: {'jobid': jobId});

        await OneSignal.login(userId);
        try {
          print('Sending notification to recipient');
          await notificationClient.sendNotification(
              'Job update: $jobTitle', 'Job Completed', userId, null);

          await notificationService.createNotification('Job update: $jobTitle',
              'Job has been completed', 'Job', ImageConstant.logo);
          print('Notification sent and saved to Firestore');
        } catch (e) {
          print('Error sending notification: $e');
        }
      } else {
        Get.back();
        SnackBar(
          content:
              Text('${response.body['message'] ?? 'Error completing job'}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('${response.body['message'] ?? 'Error completing job'}'),
          ),
        );
        error('Something went wrong');
        isError.value = true;
        isTrendLoading.value = false;
      }
    } catch (err) {
      Get.back();
      print('Error: $err');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('$err'),
        ),
      );
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }
}
