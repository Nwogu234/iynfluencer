import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MessagesPage.
///
/// This class manages the state of the MessagesPage, including the
/// current messagesModelObj
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


  @override
  void onInit() {
    super.onInit();
    // Connect to the socket.io server
    socketClient.connect();
    // Handle incoming messages
    socketClient.socket.on('receive_message', (data) {
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
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        getInfluencersChat().then((value) {
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
      error('');
      isTrendLoading.value = true;
      token = await storage.read(key: "token");
      final Response response =
          await apiClient.getAllChatsWithInfluencers(token);
      List<dynamic> chatJsonList = response.body['data']['docs'];
      print(chatJsonList.length);
      print(chatJsonList);
      if (chatJsonList.length > 0) {
        chatJsonList.forEach((e) {
          chatList.add(ChatData.fromJson(e));
        });
      }
      if (chatList.isEmpty) {
        error('');
        isTrendLoading.value = false;
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

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      socketClient.socket.emit('send_message', text);
    }
  }

  @override
  void onClose() {
    socketClient.disconnect();
    searchController.dispose();
    super.onClose();
  }
}
