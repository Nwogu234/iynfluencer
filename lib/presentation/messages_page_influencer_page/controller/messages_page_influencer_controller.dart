import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';import 'package:flutter/material.dart';import 'package:flutter/material.dart';/// A controller class for the MessagesPageInfluencerPage.
///
/// This class manages the state of the MessagesPageInfluencerPage, including the
/// current messagesPageInfluencerModelObj
class MessagesPageInfluencerController extends GetxController {MessagesPageInfluencerController(this.messagesPageInfluencerModelObj);

TextEditingController searchController = TextEditingController();

Rx<MessagesPageInfluencerModel> messagesPageInfluencerModelObj;

@override void onClose() { super.onClose(); searchController.dispose();messagesPageInfluencerModelObj.value.listgroup883ItemList.value.forEach((element) {element.framethreeController.dispose();});
 } 
 }
