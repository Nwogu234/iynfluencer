import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/creator_profile_reveiws_tab_container_screen/models/creator_profile_reveiws_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the CreatorProfileReveiwsTabContainerScreen.
///
/// This class manages the state of the CreatorProfileReveiwsTabContainerScreen, including the
/// current creatorProfileReveiwsTabContainerModelObj
class CreatorProfileReveiwsTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<CreatorProfileReveiwsTabContainerModel> creatorProfileReveiwsTabContainerModelObj = CreatorProfileReveiwsTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 3));

 }
