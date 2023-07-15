import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/chats_opened_one_screen/models/chats_opened_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChatsOpenedOneScreen.
///
/// This class manages the state of the ChatsOpenedOneScreen, including the
/// current chatsOpenedOneModelObj
class ChatsOpenedOneController extends GetxController {TextEditingController messageController = TextEditingController();

Rx<ChatsOpenedOneModel> chatsOpenedOneModelObj = ChatsOpenedOneModel().obs;

@override void onClose() { super.onClose(); messageController.dispose(); } 
 }
