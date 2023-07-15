import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/creator_profile_comm_posts_tab_container_screen/models/creator_profile_comm_posts_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the CreatorProfileCommPostsTabContainerScreen.
///
/// This class manages the state of the CreatorProfileCommPostsTabContainerScreen, including the
/// current creatorProfileCommPostsTabContainerModelObj
class CreatorProfileCommPostsTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<CreatorProfileCommPostsTabContainerModel> creatorProfileCommPostsTabContainerModelObj = CreatorProfileCommPostsTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 3));

 }
