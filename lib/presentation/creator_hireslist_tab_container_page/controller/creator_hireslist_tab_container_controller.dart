import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/models/creator_hireslist_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreatorHireslistTabContainerPage.
///
/// This class manages the state of the CreatorHireslistTabContainerPage, including the
/// current creatorHireslistTabContainerModelObj
class CreatorHireslistTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CreatorHireslistTabContainerController(
      this.creatorHireslistTabContainerModelObj);

  Rx<CreatorHireslistTabContainerModel> creatorHireslistTabContainerModelObj;

  late TabController tabiewController =
      Get.put(TabController(vsync: this, length: 2));
}
