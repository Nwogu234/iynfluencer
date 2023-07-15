import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChatsOpenedScreen.
///
/// This class manages the state of the ChatsOpenedScreen, including the
/// current chatsOpenedModelObj
class ChatsOpenedController extends GetxController {TextEditingController messageController = TextEditingController();

Rx<ChatsOpenedModel> chatsOpenedModelObj = ChatsOpenedModel().obs;

@override void onClose() { super.onClose(); messageController.dispose(); } 
 }
