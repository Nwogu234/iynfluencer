import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/service/firebase_chat_service.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chatbubble.dart';

import 'controller/chats_opened_controller.dart';
import 'models/chat_message_model.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class ChatsOpenedScreen extends GetWidget<ChatsOpenedController> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.chatMessages.length,
                itemBuilder: (context, index) {
                  return ChatMessageBubble(
                    chatMessage: controller.chatMessages[index],
                  );

                },
              );
            }),
          ),
          ChatInputBar(
            messageController: _messageController,
            onSendMessage: () {
              controller.sendMessage(_messageController.text, "user_id_here");
              _messageController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Invoke startChat when this screen is initialized
    controller.startChat("user_id_here");
  }

  void onTapArrowleft8() {
    Get.back();
  }
}
