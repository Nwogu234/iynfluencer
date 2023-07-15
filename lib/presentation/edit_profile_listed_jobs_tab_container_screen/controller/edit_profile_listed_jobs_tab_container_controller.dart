import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/models/edit_profile_listed_jobs_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditProfileListedJobsTabContainerScreen.
///
/// This class manages the state of the EditProfileListedJobsTabContainerScreen, including the
/// current editProfileListedJobsTabContainerModelObj
class EditProfileListedJobsTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<EditProfileListedJobsTabContainerModel> editProfileListedJobsTabContainerModelObj = EditProfileListedJobsTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 2));

 }
