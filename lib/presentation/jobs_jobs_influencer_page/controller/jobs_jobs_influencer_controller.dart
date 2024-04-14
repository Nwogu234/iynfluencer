import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_tabs/contoller/influencers_tabs_controller.dart';
import 'package:iynfluencer/presentation/jobs_jobs_influencer_page/models/jobs_jobs_influencer_model.dart';
import 'package:iynfluencer/widgets/app_bar/influencer_buttom_bar.dart';

import '../../../widgets/app_bar/influencer_buttom_bar.dart';

/// A controller class for the JobsJobsInfluencerPage.
///
/// This class manages the state of the JobsJobsInfluencerPage, including the
/// current jobsJobsInfluencerModelObj
class JobsJobsInfluencerController extends GetxController {
  JobsJobsInfluencerController(this.jobsJobsInfluencerModelObj);
  // Rx<JobsJobsInfluencerModel> jobsJobsInfluencerModelObj;

  Rx<List<Job>> jobsJobsInfluencerModelObj;
  final UserController user = Get.find();
  late InfluencerBottomBarController bumcont =
      Get.put(InfluencerBottomBarController());
  late InfluencerTabsController infTabcont = Get.put(InfluencerTabsController());

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isEpty = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<Job> existingJobs = []; // Existing jobs


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
        getInfluencerJobJobs(user.userModelObj.value.influencerId!)
            .then((value) {
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

  Future<void> getInfluencerJobJobs(String influencerId) async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response =
          await apiClient.getInfluencerAllJobs(influencerId, token);
      if (response.isOk) {
        List<dynamic> dd = response.body['docs'];
        dd.forEach((element) {
          existingJobs.add(Job.fromJson(element));
        });
        if (existingJobs.isEmpty) {
          error('');
          isEpty.value = true;
          isTrendLoading.value = false;
        } else {
          jobsJobsInfluencerModelObj.value = existingJobs;
          error('');
          isTrendLoading.value = false;
        }
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  @override
  void onInit() {
    getUser();

    super.onInit();
  }

  @override
  void onClose() {
    bumcont.dispose();
    infTabcont.dispose();
    super.onClose();
  }
}
