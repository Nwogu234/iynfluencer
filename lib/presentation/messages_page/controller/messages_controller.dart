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
  TextEditingController searchController = TextEditingController();
  final Rx<MessagesModel> messagesModelObj = MessagesModel().obs;
  final RxList<ChatData> chatList = <ChatData>[].obs;
  final RxString error = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isTrendLoading = false.obs;
  RxInt unreadCreator = 0.obs;

  final UserController user = Get.find();
  final ApiClients apiClient = ApiClients();
  final SocketClient socketClient = SocketClient.to;
  final FlutterSecureStorage storage = FlutterSecureStorage();


  @override
  void onInit() {
    super.onInit();
    socketClient.connect();
    print(socketClient.isConnected);
    getUser();
  }

  Future<void> getUser() async {
    isLoading.value = true;
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error.value = 'Something went wrong with user data';
      } else {
        await getInfluencersChat();
      }
    } catch (e) {
      error.value = 'Error fetching user: $e';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getInfluencersChat() async {
    isTrendLoading.value = true;
    try {
      String? token = await storage.read(key: "token");
      var response = await apiClient.getAllChatsWithInfluencers(token!);
      var chatJsonList = response.body['data']['docs'] as List;
      chatList.assignAll(chatJsonList.map((e) => ChatData.fromJson(e)).toList());
      if (chatList.isEmpty) {
        error.value = 'You don\'t have Influencers in your chats';
      }
    } catch (e) {
      error.value = 'Error fetching chats: $e';
      print('Error fetching influencers chat: $e');
    } finally {
      isTrendLoading.value = false;
    }
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    await getUser();
  }

  void setUnreadCreator(int value) {
    unreadCreator.value = value;
  }

  @override
  void onClose() {
    socketClient.socket.off('newMessage');
    socketClient.socket.off('error');
    socketClient.disconnect();
    searchController.dispose();
    super.onClose();
  }
}
