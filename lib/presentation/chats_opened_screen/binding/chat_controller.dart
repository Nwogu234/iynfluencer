import 'package:get/get.dart';

import '../models/chat_message_model.dart';
import '../service/chat_service.dart';

class ChatController extends GetxController {
  final ChatService _chatService = ChatService();

  RxList<ChatMessageModel> chatMessages = <ChatMessageModel>[].obs;

  void sendMessage(String message, String senderId) {
    _chatService.sendMessage(message, senderId);
  }

  void startChat(String userId) {
    // You can perform any initialization here if needed
    // For example, fetching initial messages, setting up the UI, etc.
    _chatService.getMessages().listen((snapshot) {
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
