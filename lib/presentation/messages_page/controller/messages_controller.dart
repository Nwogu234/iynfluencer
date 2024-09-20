import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/general_controllers/sockect_client.dart';

class MessagesController extends GetxController {
  MessagesController(this.messagesModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<MessagesModel> messagesModelObj;

  var messages = <String>[].obs;
  bool empty = false;
  var token;
  var error = ''.obs;
  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final storage = new FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  List<ChatData> chatList = <ChatData>[].obs;
  late RxList<ChatData> chatModelObj = <ChatData>[].obs;
  Rx<ChatData?> lastMessage = Rx<ChatData?>(null);
  RxInt unreadCreator = 0.obs;

  RxList<ChatData> filteredChatList = <ChatData>[].obs;

  @override
  void onInit() {
    super.onInit();

    socketClient.connect();

    socketClient.socket.on('connected', (data) {
      messages.add(data.toString());
      update();
    });

    socketClient.socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });

    getUser();
  }

  void search(String query) {
    searchController.text = query;

    final lowerQuery = query.toLowerCase();
    print('This is the search query: $query');

    Future.delayed(Duration(milliseconds: 500), () {
      if (lowerQuery.isEmpty) {
        chatModelObj.value = chatList;
      } else {
        chatModelObj.value = chatList.where((chat) {
          final firstName = chat.influencerUser?.firstName?.toLowerCase() ?? '';
          final lastName = chat.influencerUser?.lastName?.toLowerCase() ?? '';
          final lastMessageText = chat.messages.isNotEmpty
              ? chat.messages.last.text.toLowerCase()
              : '';

          return firstName.contains(lowerQuery) ||
              lastName.contains(lowerQuery) ||
              lastMessageText.contains(lowerQuery);
        }).toList();
      }

      if (chatModelObj.isEmpty) {
        error('No Results Found');
        Get.snackbar(
          'No Results Found',
          'No chats match your search query.',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );
      }
      searchController.clear();
    });
  }

  getUser() async {
    isLoading.value = false;
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        await getInfluencersChat().then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  Future<void> getInfluencersChat() async {
    try {
      isTrendLoading.value = true;
      token = await storage.read(key: "token");
      final Response response =
          await apiClient.getAllChatsWithInfluencers(token);
      List<dynamic> chatJsonList = response.body['data']['docs'];
      chatList.clear();
      print(chatJsonList.length);
      print(chatJsonList);
      if (chatJsonList.isNotEmpty) {
        chatList.addAll(chatJsonList.map((e) => ChatData.fromJson(e)).toList());
        chatList.sort((a, b) {
          final aLastMessageTime =
              a.messages.isNotEmpty ? a.messages.last.createdAt : a.updatedAt;
          final bLastMessageTime =
              b.messages.isNotEmpty ? b.messages.last.createdAt : b.updatedAt;
          return bLastMessageTime.compareTo(aLastMessageTime);
        });
        chatModelObj.value = chatList;
        error('');
        saveChats(chatList);
      }
      if (chatList.isEmpty) {
        error('You don\'ts have Influencers in your chats');
        empty = true;
        print('No chat data available.');
      }
      isTrendLoading.value = false;
    } catch (e) {
      print('Error fetching influencers chat: $e');
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  Future<void> saveChats(List<ChatData> chats) async {
    try {
      final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chats');
      await chatBox.clear();
      await chatBox.addAll(chats);

      print('chats saved sucessfully');
    } catch (e) {
      print('Error saving messages: $e');
    }
  }


/* 
Future<void> loadChatOrFetch() async {
  isLoading.value = false; 
  
  try {
    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chats');
    final List<ChatData> storedChats = chatBox.values.toList();

    for (ChatData chat in storedChats) {
      final String chatId = chat.chatId;
      final Box<Message> messageBox = await Hive.openBox<Message>('messages_$chatId');
      final List<Message> storedMessages = messageBox.values.toList();

      if (storedMessages.isNotEmpty) {
        final lastMessage = storedMessages.last;

        final updatedMessages = List<Message>.from(chat.messages);
        updatedMessages.removeLast();
        updatedMessages.add(lastMessage); 

        chat.messages = updatedMessages; 
       //  final lastMessage = storedMessages.last;
        chat.messages.last = lastMessage; 
        chat.messages.last.createdAt = lastMessage.createdAt; 
        await chatBox.put(chat.chatId, chat);
      }
    }

     final List<ChatData> updatedChats = chatBox.values.toList();
    chatList.clear();
    chatList.addAll(updatedChats);
    chatModelObj.value = chatList;

    print('Chats and messages loaded successfully from local storage.');
    

    if (storedChats.isEmpty) {
      isLoading.value = true;
      await getInfluencersChat();
      print('Fetched chats from the API.');
    }
  } catch (e) {
    print('Error loading or fetching chats and messages: $e');
    error.value = 'Failed to load chats';
  } finally {
    isLoading.value = false;
  }
}
 */

Future<void> loadChatOrFetch() async {
  isLoading.value = false; 

  try {
    final Box<ChatData> chatBox = await Hive.openBox<ChatData>('chats');
    final List<ChatData> storedChats = chatBox.values.toList();

    for (ChatData chat in storedChats) {
      final String chatId = chat.chatId;
      final Box<Message> messageBox = await Hive.openBox<Message>('messages_$chatId');
      final List<Message> storedMessages = messageBox.values.toList();

      if (storedMessages.isNotEmpty) {
        final lastMessage = storedMessages.last;

        // Copy the messages and chat data to avoid modifying the same object in Hive
        final updatedMessages = List<Message>.from(chat.messages);
        
        if (updatedMessages.isNotEmpty) {
          updatedMessages.removeLast(); // Remove old last message
        }
        updatedMessages.add(lastMessage); // Add the new last message

       
         final ChatData updatedChat = ChatData(
          id: chat.id,
          chatId: chat.chatId,
          creatorId: chat.creatorId,
          influencerId: chat.influencerId,
          creatorUserId: chat.creatorUserId,
          influencerUserId: chat.influencerUserId,
          unreadByCreator: chat.unreadByCreator,
          unreadByInfluencer: chat.unreadByInfluencer,
          blockedByCreator: chat.blockedByCreator,
          blockedByInfluencer: chat.blockedByInfluencer,
          updatedAt: chat.updatedAt,
          createdAt: chat.createdAt,
          messages: updatedMessages, // Assign updated messages here
        );

        // Save the updated chat data back to Hive with the correct chatId
        await chatBox.put(updatedChat.chatId, updatedChat);
      }
    }

    // If there are no chats in the local storage, fetch them from the API
    if (storedChats.isEmpty) {
      isLoading.value = true;
      await getInfluencersChat();
      print('Fetched chats from the API.');
    }

    // After everything is processed, update the chat model
    final List<ChatData> updatedChats = chatBox.values.toList();
    chatModelObj.clear();
    chatModelObj.addAll(updatedChats);

    print('Chats and messages loaded successfully from local storage.');

  } catch (e) {
    print('Error loading or fetching chats and messages: $e');
    error.value = 'Failed to load chats';
  } finally {
    isLoading.value = false;
  }
}



  void setUnreadCreator(int value) {
    unreadCreator.value = value;
  }

  @override
  void onClose() {
    // socketClient.disconnect();
    searchController.dispose();
    super.onClose();
  }
}



