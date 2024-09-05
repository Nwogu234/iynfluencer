import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  
  getUser() async {
    isLoading.value = true;
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

  
/* 
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
      if (chatJsonList.length > 0) {
        chatJsonList.forEach((e) {
          chatList.add(ChatData.fromJson(e));
        });
      }
      if (chatList.isEmpty) {
        error('You don\'s have Influencers in your chats');
        empty = true;
        print('No chat data available.');
      } else {
        chatModelObj.value = chatList;
        error('');
        isTrendLoading.value = false;
      }
      isTrendLoading.value = false;
    } catch (e) {
      print('Error fetching influencers chat: $e');
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }
 */


  Future<void> getInfluencersChat() async {
  try {
    isTrendLoading.value = true;
    token = await storage.read(key: "token");
    final Response response = await apiClient.getAllChatsWithInfluencers(token);
    List<dynamic> chatJsonList = response.body['data']['docs'];
    chatList.clear();
    print(chatJsonList.length);
    print(chatJsonList);
    if (chatJsonList.isNotEmpty) {
      chatList.addAll(chatJsonList.map((e) => ChatData.fromJson(e)).toList());
      chatList.sort((a, b) {
        final aLastMessageTime = a.messages.isNotEmpty ? a.messages.last.createdAt : a.updatedAt;
        final bLastMessageTime = b.messages.isNotEmpty ? b.messages.last.createdAt : b.updatedAt;
        return bLastMessageTime.compareTo(aLastMessageTime);
      });
      chatModelObj.value = chatList;
      error('');
    } if (chatList.isEmpty) {
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
