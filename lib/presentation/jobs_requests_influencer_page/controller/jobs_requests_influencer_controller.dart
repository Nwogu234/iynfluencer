import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/jobs_requests_influencer_page/models/jobs_requests_influencer_model.dart';

/// A controller class for the JobsRequestsInfluencerPage.
///
/// This class manages the state of the JobsRequestsInfluencerPage, including the
/// current jobsRequestsInfluencerModelObj
class JobsRequestsInfluencerController extends GetxController {
  JobsRequestsInfluencerController();

  late RxList<JobsRequestsInfluencerModel> jobsRequestsInfluencerModelObj =
      <JobsRequestsInfluencerModel>[].obs;

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<JobsRequestsInfluencerModel> existingJobs = [];
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
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
        getInfluencerRequestJob().then((value) {
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
  Future<void> getInfluencerRequestJob() async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response = await apiClient.getInfluencerJobsRequests(token);
      List<dynamic> jobJsonList = response.body['data']['docs'];
      print(jobJsonList.length);
      if (jobJsonList.length > 0) {
        jobJsonList.forEach((e) {
          if (e['status'] != 'declined') {
            existingJobs.add(JobsRequestsInfluencerModel.fromJson(e));
          }
        });
      }
      if (existingJobs.isEmpty) {
        error('');
        isTrendLoading.value = false;
      } else {
        jobsRequestsInfluencerModelObj.value = existingJobs;
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

  Future<void> influencerDeclineRequestJob(String id, close) async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response =
          await apiClient.InfluencerDeclineJobsRequests(token, id);

      if (response.statusCode == 201 || response.body['status'] == 'SUCCESS') {
        close!.pop();
        Get.snackbar('Success', 'Job Request Declined Successfully');

        getUser();
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', 'Something went wrong');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
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
    // searchController.dispose();
  }
}
