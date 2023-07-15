import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/messages_page_one_screen/models/messages_page_one_model.dart';import 'package:flutter/material.dart';import 'package:flutter/material.dart';/// A controller class for the MessagesPageOneScreen.
///
/// This class manages the state of the MessagesPageOneScreen, including the
/// current messagesPageOneModelObj
class MessagesPageOneController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<MessagesPageOneModel> messagesPageOneModelObj = MessagesPageOneModel().obs;

@override void onClose() { super.onClose(); searchController.dispose();messagesPageOneModelObj.value.messagesPage1ItemList.value.forEach((element) {element.framethreeController.dispose();});
 } 
 }
