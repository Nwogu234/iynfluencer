import 'package:iynfluencer/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileListedJobsTabTwoContainerScreen.
///
/// This class manages the state of the EditProfileListedJobsTabTwoContainerScreen, including the
/// current editProfileListedJobsTabTwoContainerModelObj
class EditProfileListedJobsTabTwoContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /* Rx<EditProfileListedJobsTabTwoContainerModel>
      editProfileListedJobsTabTwoContainerModelObj =
      EditProfileListedJobsTabTwoContainerModel().obs;
 */
  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
