import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_post_screen/models/community_post_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CommunityPostScreen.
///
/// This class manages the state of the CommunityPostScreen, including the
/// current communityPostModelObj
class CommunityPostController extends GetxController {
  TextEditingController inputController = TextEditingController();

  TextEditingController frametwelveController = TextEditingController();

  Rx<CommunityPostModel> communityPostModelObj = CommunityPostModel().obs;

  @override
  void onClose() {
    super.onClose();
    inputController.dispose();
    frametwelveController.dispose();
  }
}
