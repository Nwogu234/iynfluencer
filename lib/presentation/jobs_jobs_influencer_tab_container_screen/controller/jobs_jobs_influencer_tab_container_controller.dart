import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/jobs_jobs_influencer_tab_container_screen/models/jobs_jobs_influencer_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the JobsJobsInfluencerTabContainerScreen.
///
/// This class manages the state of the JobsJobsInfluencerTabContainerScreen, including the
/// current jobsJobsInfluencerTabContainerModelObj
class JobsJobsInfluencerTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  JobsJobsInfluencerTabContainerController(
      this.jobsJobsInfluencerTabContainerModelObj);

  Rx<JobsJobsInfluencerTabContainerModel>
  jobsJobsInfluencerTabContainerModelObj =
      JobsJobsInfluencerTabContainerModel().obs;

  late TabController tabsviewController =
  Get.put(TabController(vsync: this, length: 3));


}

