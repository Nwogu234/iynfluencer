import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/creator_profile_listed_jobs_page/models/creator_profile_listed_jobs_model.dart';

/// A controller class for the CreatorProfileListedJobsPage.
///
/// This class manages the state of the CreatorProfileListedJobsPage, including the
/// current creatorProfileListedJobsModelObj
class CreatorProfileListedJobsController extends GetxController {
  CreatorProfileListedJobsController(this.creatorProfileListedJobsModelObj);

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  bool empty=false;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<Job> existingJobs = []; 
  RxList<Job> newJobs = <Job>[].obs;
   late AnimationController animationController;

  
  RxList<Job> creatorProfileListedJobsModelObj;

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
        isLoading.value = false;
        getJob();
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> getJob() async {
    try {
      error('');
      token = await storage.read(key: "token");
      isTrendLoading.value = true;
      Response response = await apiClient.getCreatorJobs(token);

      if (response.isOk) {
        final responseJson = response.body;
        final jobResponse = JobResponse.fromJson(responseJson);
        if (jobResponse.data.docs.isEmpty){
          empty=true;
        }
        existingJobs= jobResponse.data.docs;
        error('');
        isTrendLoading.value = false;
      } else {
        error('Something went wrong');
        isTrendLoading..value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }


  @override
  void onInit() {
    print('OnInit called');
    getJob();
    super.onInit();
  }
}
