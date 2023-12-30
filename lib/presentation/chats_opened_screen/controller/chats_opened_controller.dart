import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/service/firebase_chat_service.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chat_message_model.dart';

class ChatsOpenedController extends GetxController {
  final FirebaseChatService _firebaseChatService = FirebaseChatService();

  var messageController = TextEditingController();
  RxList<ChatMessageModel> chatMessages = <ChatMessageModel>[].obs;

  void sendMessage(String message, String senderId) {
    _firebaseChatService.sendMessage(message, senderId);
  }

  void startChat(String userId) {
    _firebaseChatService.getMessages().listen((snapshot) {
      chatMessages.assignAll(snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ChatMessageModel(
          messageText: data['text'],
          isReceived: data['senderId'] != userId,
          timestamp: data['timestamp'],
        );
      }).toList());
    });
  }


}

