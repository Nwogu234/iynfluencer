import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/job_details_screen/models/job_details_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the JobDetailsScreen.
///
/// This class manages the state of the JobDetailsScreen, including the
/// current jobDetailsModelObj
class JobDetailsController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  var token;
  var error = ''.obs;
  Rx<Job?> jobDetailsModelObj = Rx<Job?>(null);

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
}
