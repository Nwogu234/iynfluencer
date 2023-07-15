import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/chats_screen/models/chats_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChatsScreen.
///
/// This class manages the state of the ChatsScreen, including the
/// current chatsModelObj
class ChatsController extends GetxController {TextEditingController messageController = TextEditingController();

Rx<ChatsModel> chatsModelObj = ChatsModel().obs;

@override void onClose() { super.onClose(); messageController.dispose(); } 
 }
