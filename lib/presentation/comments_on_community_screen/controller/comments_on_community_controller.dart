import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/comments_on_community_screen/models/comments_on_community_model.dart';import 'package:flutter/material.dart';/// A controller class for the CommentsOnCommunityScreen.
///
/// This class manages the state of the CommentsOnCommunityScreen, including the
/// current commentsOnCommunityModelObj
class CommentsOnCommunityController extends GetxController {TextEditingController commentController = TextEditingController();

Rx<CommentsOnCommunityModel> commentsOnCommunityModelObj = CommentsOnCommunityModel().obs;

@override void onClose() { super.onClose(); commentController.dispose(); } 
 }
