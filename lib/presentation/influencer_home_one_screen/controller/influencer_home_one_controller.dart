import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/influencer_home_one_screen/models/influencer_home_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the InfluencerHomeOneScreen.
///
/// This class manages the state of the InfluencerHomeOneScreen, including the
/// current influencerHomeOneModelObj
class InfluencerHomeOneController extends GetxController {TextEditingController becomeinfluenceController = TextEditingController();

TextEditingController searchController = TextEditingController();

Rx<InfluencerHomeOneModel> influencerHomeOneModelObj = InfluencerHomeOneModel().obs;

@override void onClose() { super.onClose(); becomeinfluenceController.dispose(); searchController.dispose(); } 
 }
