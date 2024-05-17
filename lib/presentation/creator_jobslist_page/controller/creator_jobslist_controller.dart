import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the HomeCreatorPage.
///
/// This class manages the state of the HomeCreatorPage, including the
/// current homeCreatorModelObj
class CreatorJobslistController extends GetxController {
  CreatorJobslistController(this.creatorJobslistModelObj);
  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  bool empty=false;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<Job> existingJobs = []; // Existing jobs
  RxList<Job> newJobs = <Job>[].obs; // new jobs
  TextEditingController searchController = TextEditingController();

  RxList<Job> creatorJobslistModelObj;

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
        isLoading.value = false;
        getJobs();
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> getJobs() async {
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
    getJobs();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
