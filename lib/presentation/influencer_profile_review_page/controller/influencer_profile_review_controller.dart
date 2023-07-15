import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_profile_review_page/models/influencer_profile_review_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InfluencerProfileReviewPage.
///
/// This class manages the state of the InfluencerProfileReviewPage, including the
/// current influencerProfileReviewModelObj
class InfluencerProfileReviewController extends GetxController {
  InfluencerProfileReviewController(this.influencerProfileReviewModelObj);

  TextEditingController locationController = TextEditingController();

  TextEditingController locationoneController = TextEditingController();

  Rx<InfluencerProfileReviewModel> influencerProfileReviewModelObj;

  @override
  void onClose() {
    super.onClose();
    locationController.dispose();
    locationoneController.dispose();
  }
}
