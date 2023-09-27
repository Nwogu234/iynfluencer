import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/models/influencer_profile_comm_post_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InfluencerProfileCommPostTabContainerScreen.
///
/// This class manages the state of the InfluencerProfileCommPostTabContainerScreen, including the
/// current influencerProfileCommPostTabContainerModelObj
class InfluencerProfileCommPostTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
 Rx<Influencer?> influencerProfileCommPostTabContainerModelObj =
 Rx<Influencer?>(null);

 late TabController tabviewController =
 Get.put(TabController(vsync: this, length: 4));

 void setSelectedInfluencer(Influencer listrectangle50) {
  influencerProfileCommPostTabContainerModelObj.value = listrectangle50;
 }
}
