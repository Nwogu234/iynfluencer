import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:flutter/material.dart';

class ChatsOpenedController extends GetxController {
  late final ChatData chatData;

  ChatsOpenedController({required this.chatData}) {
      messageModelObj =
        chatData.messages.obs;

  }

  TextEditingController messageController = TextEditingController();
  Rx<ChatsOpenedModel> chatsOpenedModelObj = ChatsOpenedModel().obs;
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
  late RxList<Message> messageModelObj;
  //String chatId = '';

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
    print('Chat data before getUser: $chatData');

   // final String chatId = Get.parameters['id'] ?? '';
   final String chatId = chatData.chatId;
    getUser(chatId);
  }

  getUser(String chatId) async {
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
          fetchAllMessagesWithInfluencers(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        }); 
      //  fetchAllMessagesWithInfluencers(chatId);
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

   Future<void> fetchAllMessagesWithInfluencers(String chatId) async {
    try {
      final String chatId = chatData.chatId;
      error('');
      isTrendLoading.value = true;
      token = await storage.read(key: "token");
      final Response response =
          await apiClient.getAllMessagesWithInfluencer(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        print('Response Data: $responseData');
        final List<dynamic> chatDataList = responseData['data']['docs'];
        print('Response Data: $chatDataList');
        final List<Message> messages = [];

        for (var chatDataJson in chatDataList) {
          final ChatData chatsData = ChatData.fromJson(chatDataJson);
          if (chatsData.id == chatId) {
            this.chatData = chatsData; // Update the chatData here
            messages.addAll(chatsData.messages);
            break;
          }
        }

        messageModelObj.assignAll(messages);
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

 /*  void fetchAllMessagesWithInfluencers(String chatId) {
   // final String chatId = chatData.chatId;
    error('');
    isTrendLoading.value = true;
    storage.read(key: "token").then((String? token) {
      apiClient
          .getAllMessagesWithInfluencer(chatId, token!)
          .then((Response response) {
        if (response.isOk) {
          final responseData = response.body;
          final List<dynamic> chatDataList = responseData['data']['docs'];
          final List<Message> messages = [];

          /* for (var chatDataJson in chatDataList) {
            final ChatData chatsData = ChatData.fromJson(chatDataJson);
            if (chatsData.id == chatId) {
              this.chatData = chatsData; // Update the chatData here
              messages.addAll(chatsData.messages);
              break;
            }
          } */

          for (var chatDataJson in chatDataList) {
          final ChatData chatsData = ChatData.fromJson(chatDataJson);
          // Check if the ID is not null and is a string
        if (chatsData.id != null && chatsData.id is String && chatsData.id == chatId) {
          this.chatData = chatsData; // Update the chatData here
          messages.addAll(chatsData.messages);
         break;
       }
}

          messageModelObj.assignAll(messages);
        } else {
          error('Failed to fetch messages: ${response.statusText}');
        }
      }).catchError((e) {
        print('Error fetching messages: $e');
        error('Failed to fetch messages');
      }).whenComplete(() {
        isTrendLoading.value = false;
      });
    }).catchError((e) {
      print('Error fetching token: $e');
      error('Failed to fetch messages');
      isTrendLoading.value = false;
    });
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




/* import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChatsOpenedScreen.
///
/// This class manages the state of the ChatsOpenedScreen, including the
/// current chatsOpenedModelObj
class ChatsOpenedController extends GetxController {
  TextEditingController messageController = TextEditingController();

  Rx<ChatsOpenedModel> chatsOpenedModelObj = ChatsOpenedModel().obs;

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
  List<Message> messageList = <Message>[].obs;
  late RxList<Message> messageModelObj = <Message>[].obs;
  ChatData? chatData;
  // String chatId = '';

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

  //  final String chatId = chatData!.chatId;
    getUser(Get.parameters['id'] as String);
  }

  getUser(String chatId) async {
    isLoading.value = true;
    error.value = '';
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        fetchAllMessagesWithInfluencers(chatId).then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print('Error in getUser: $e');
      error.value = 'Failed to fetch messages';
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

Future<void> fetchAllMessagesWithInfluencers(String chatId) async {
    try {
      error('');
      isTrendLoading.value = true;
      token = await storage.read(key: "token");
      final Response response =
          await apiClient.getAllMessagesWithInfluencer(chatId, token);
      if (response.isOk) {
        final responseData = response.body;
        print('Response Data: $responseData');
        final List<dynamic> chatDataList = responseData['data']['docs'];
        print('Response Data: $chatDataList');
        final List<Message> messages = [];

        for (var chatDataJson in chatDataList) {
          final ChatData chatsData = ChatData.fromJson(chatDataJson);
          if (chatsData.id == chatId) {
            this.chatData = chatsData; // Update the chatData here
            messages.addAll(chatsData.messages);
            break;
          }
        }

        messageModelObj.assignAll(messages);

        if (chatData == null) {
          error('');
          isTrendLoading.value = false;
          empty = true;
          print('No chat data available.');
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

 */


