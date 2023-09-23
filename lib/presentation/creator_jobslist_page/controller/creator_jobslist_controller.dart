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
        Job newJob = Job(
          id: 'placeholder_id',
          creatorId: 'placeholder_creator_id',
          title: 'New Job Title',
          description: 'No description available.',
          responsibilities: ['No responsibilities specified'],
          category: ['Uncategorized'],
          budgetFrom: 0,
          budgetTo: 0,
          duration: 0,
          public: true,
          hired: false,
          suspended: false,
          jobId: 'placeholder_job_id',
          createdAt: '2023-08-17T00:00:00.000Z',
          updatedAt: '2023-08-17T00:00:00.000Z',
          version: 1,
          creator: [],
          bidsCount: 0,
        );
        // getNewJob(newJob); Why are you creating a new job
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
      isTrendLoading.value = true;
      existingJobs = await apiClient.getInfluencerJobs(1, 15, 8000, token);
      if (existingJobs.isEmpty) {
        error('Something went wrong');
        isTrendLoading.value = false;
      } else {
        error('');
        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  Future<void> getNewJob(Job newJob) async {
    isRecommendedLoading.value = true;
    try {
      error('');
      final response = await apiClient.createJob(newJob, token);

      if (response.isOk) {
        // If the job creation is successful, add it to the list of trendingJobs
        final createdJob = Job.fromJson(response.body['data']);
        existingJobs.insert(0, createdJob); // Add the new job at the beginning
      } else {
        throw Exception(
            'Failed to create a new job. Server error: ${response.statusText}');
      }
    } catch (e) {
      error('Something went wrong');
      print(e);
      isRecommendedLoading.value = false;
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
    searchController.dispose();
  }
}
