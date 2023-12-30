import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/binding/chat_controller.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../service/chat_service.dart';
import '../service/firebase_chat_service.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController messageController;
  final ChatsInputController chatsInputController;

  ChatInputBar({
    required this.messageController,
    required this.chatsInputController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatsInputController());
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ChatInputBar(
        messageController: messageController,
        chatsInputController: chatsInputController,
      ),
    );
  }
}

class ChatsInputController extends GetxController {
  var message = "".obs;
  final FirebaseChatService _firebaseChatService = FirebaseChatService();

  void sendMessage(String senderId) {
    if (message.value.isNotEmpty) {
      _firebaseChatService.sendMessage(message.value, senderId);
      message.value = "";
    }
  }
}


