import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/chats_influencer_screen.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/model/chat_influencer_model.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/chats_opened_screen.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatsInfluencerController extends GetxController {
  final ChatData chatData;
  final Job? selectedJob;

  ChatsInfluencerController({required this.chatData, this.selectedJob}) {
    messageModelObjs = chatData.messages.obs;
  }

  TextEditingController messageController = TextEditingController();
  Rx<ChatsInfluencerModel> chatsinfluencerModelObj = ChatsInfluencerModel().obs;
  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  RxList<Message> messageModelObjs = <Message>[].obs;
  final message = ''.obs;
  late final RxBool isDeleted = false.obs;

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('receive_message', (data) {
      messages.add(data.toString());
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });

    final String chatId = chatData.chatId;
    getUser(chatId);
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    final String chatId = chatData.chatId;
    getUser(chatId);
  }

  Future<void> getUser(String chatId) async {
    isLoading.value = true;
    error.value = '';
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      print('User data: ${user.userModelObj.value}');
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        loadMessages(chatId);
        fetchAllMessagesWithCreators(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
        //  onTapChatCard(selectedInfluencer, chatData);
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAllMessagesWithCreators(String chatId) async {
    try {
      error.value = '';
      isLoading.value = true;
      error.value = '';
      token = await storage.read(key: "token");
      final Response response = await apiClient.getAllMessages(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        final List<dynamic>? chatDataList = responseData['data']?['docs'];
        print('chatdatalist: $chatDataList');
        final List<Message> messages = [];

        if (chatDataList != null) {
          for (var chatDataJson in chatDataList) {
            final Message message = Message.fromJson(chatDataJson);
            messages.add(message);
          }
          messageModelObjs.assignAll(messages);
          saveMessages(messages, chatId);
        } else {
          error('Failed to fetch messages: Data not available');
        }
      } else {
        error('Failed to fetch messages: ${response.statusText}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
      error('Failed to fetch messages');
    } finally {
      isTrendLoading.value = false;
    }
  }

  Future<void> saveMessages(List<Message> messages, String chatId) async {
    try {
      final List<String> serializedMessages =
          messages.map((message) => jsonEncode(message.toJson())).toList();
      final String serializedMessagesString = jsonEncode(serializedMessages);
      await storage.write(
          key: 'messages_$chatId', value: serializedMessagesString);
      print('Messages saved successfully for chat ID: $chatId');
    } catch (e) {
      print('Error saving messages: $e');
      // Handle error as needed
    }
  }

  Future<List<Message>> loadMessages(String chatId) async {
    final serializedMessagesString =
        await storage.read(key: 'messages_$chatId');

    if (serializedMessagesString != null &&
        serializedMessagesString.isNotEmpty) {
      final List<dynamic> decodedList = jsonDecode(serializedMessagesString);

      // Check if the decoded data is a list
      if (decodedList is List) {
        final List<Map<String, dynamic>> serializedMessages =
            decodedList.cast<Map<String, dynamic>>();

        // Map each Map<String, dynamic> to a Message object using Message.fromJson
        final List<Message> messages =
            serializedMessages.map((map) => Message.fromJson(map)).toList();

        return messages;
      } else {
        print('Invalid JSON format: $serializedMessagesString');
        return [];
      }
    } else {
      print('No messages found for chatId: $chatId');
      return [];
    }
  }

  Future<void> deleteIdMessage(String deleteMessage) async {
    try {
      final token = await storage.read(key: "token");
      final chatId = chatData.chatId;
      final response =
          await apiClient.deleteMessage(chatId, deleteMessage, token!);

      if (response.isOk) {
        print('Message deleted successfully');
        isDeleted.value = true;
        // Remove the deleted message from the list
        messageModelObjs
            .removeWhere((message) => message.messageId == deleteMessage);
        isDeleted.value = true;
        update();
      } else {
        if (response.statusCode == null) {
          print('Failed to delete message: Network error');
        } else {
          print(
              'Failed to delete message: ${response.statusCode}, ${response.body}');
        }
      }
    } catch (e) {
      // Handle any exceptions that occur during the deletion process
      print('Error deleting message: $e');
    }
  }

  void onTapChatCard(Job? selectedJob, ChatData chatData) async {
    if (selectedJob == null) {
      print("selectedJob is null");
      return;
    }

    isLoading.value = true;
    error('');

    try {
      isLoading.value = true;
      error('');
      token = await storage.read(key: "token");

      if (token == null) {
        print("token is null");
        return;
      }

      Response existingsChatResponse =
          await apiClient.getAllChatsWithCreators(token!);
      if (existingsChatResponse.isOk && existingsChatResponse.body != null) {
        //  final List<dynamic>? responseData = existingChatResponse.body;
        List<dynamic> chatListMaps = existingsChatResponse.body['data']['docs'];
        List<ChatData> chatList =
            chatListMaps.map((chatMap) => ChatData.fromJson(chatMap)).toList();

        ChatData? existingsChat = chatList
            .firstWhereOrNull((chat) => chat.influencerId == selectedJob.id);

        if (existingsChat != null) {
          await fetchAllMessagesWithCreators(existingsChat.chatId);
          Get.to(ChatsInfluencerScreen(
            selectedJob: selectedJob,
            chatData: existingsChat,
          ));
          return;
        } else {
          print("No existing chat found for the selected creator");
          // No existing chat, proceed to create a new one
          final now = DateTime.now();
          final formattedTime = DateFormat('HH:mm').format(now);
          final createdAt = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(formattedTime.substring(0, 2)),
            int.parse(formattedTime.substring(3)),
            0,
          );

          String chatId = Uuid().v4();
          String influencerId = user.userModelObj.value.id;
          String influencerUserId = user.userModelObj.value.userId;
          print('non-null: $influencerId + $influencerUserId');

          ChatData newsChat = ChatData(
            id: '',
            creatorId: selectedJob.creator?.id ?? '',
            influencerId: influencerId,
            creatorUserId: selectedJob.creator?.userId ?? '',
            influencerUserId: influencerUserId,
            unreadByCreator: 0,
            unreadByInfluencer: 0,
            blockedByCreator: false,
            blockedByInfluencer: false,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: createdAt,
            messages: [],
          );

          // Create the new chat
          Response createChatResponse =
              await apiClient.createChat(newsChat, token);
          if (createChatResponse.isOk) {
            print('Chat created successfully');
            Map<String, dynamic> chatDataMap = createChatResponse.body;
            ChatData createdChat = ChatData.fromJson(chatDataMap);

            // Navigate to the chat screen with the new chat data
            Get.to(ChatsInfluencerScreen(
              selectedJob: selectedJob,
              chatData: createdChat,
            ));
          } else {
            print("Failed to create chat: ${createChatResponse.statusCode}");
          }
        }
      } else {
        print(
            "Failed to fetch existing chats: ${existingsChatResponse.statusCode}");
      }
    } catch (e) {
      print("Error creating or fetching chat: $e");
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

/* 
void saveMessages(List<Message> messages) async {
  final List<String> serializedMessages = messages.map((message) => jsonEncode(message.toJson())).toList();
  final String serializedMessagesString = jsonEncode(serializedMessages);
  await storage.write(key: 'messages_${chatData.chatId}', value: serializedMessagesString);
}
 */
/* 
Future<List<Message>> loadMessages() async {
  final String? serializedMessagesString = await storage.read(key: 'messages_${widget.chatData.chatId}');
  if (serializedMessagesString != null) {
    final List<dynamic> serializedMessages = jsonDecode(serializedMessagesString);
    return serializedMessages.map((json) => Message.fromJson(json)).toList();
  } else {
    return [];
  }
} */

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String formattedDateTime = DateFormat('h:mm a').format(dateTime);
    return formattedDateTime;
  }

  @override
  void onClose() {
    super.onClose();
    messageController.dispose();
    socketClient.disconnect();
  }
}
