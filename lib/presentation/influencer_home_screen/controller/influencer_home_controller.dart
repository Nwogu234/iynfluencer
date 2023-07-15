import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';import 'package:flutter/material.dart';/// A controller class for the InfluencerHomeScreen.
///
/// This class manages the state of the InfluencerHomeScreen, including the
/// current influencerHomeModelObj
class InfluencerHomeController extends GetxController {InfluencerHomeController(this.influencerHomeModelObj);

 TextEditingController searchController = TextEditingController();

Rx<InfluencerHomeModel> influencerHomeModelObj = InfluencerHomeModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
