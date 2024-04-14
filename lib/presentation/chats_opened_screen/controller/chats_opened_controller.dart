import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/chatApi.dart';
import 'package:iynfluencer/data/general_controllers/sockect_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';import 'package:iynfluencer/presentation/chats_opened_screen/models/chats_opened_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChatsOpenedScreen.
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
   List<ChatData> messageList = <ChatData>[].obs;
  late RxList<ChatData> messageModelObj = <ChatData>[].obs;

  
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

    getUser(Get.parameters['chatId']);
  }

  getUser(String? chatId) async {
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
        fetchAllMessagesWithInfluencers(chatId!)
            .then((value) {
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


  Future<void> fetchAllMessagesWithInfluencers(String chatId) async {
  try {
    error('');
    isTrendLoading.value = true;
    token = await storage.read(key: "token");
    final Response response = await apiClient.getAllMessagesWithInfluencer(chatId, token);
    if(response.isOk){
      List<dynamic> messageJsonList = response.body['data']['docs'];
      print(messageJsonList.length);
       print(messageJsonList);
       messageJsonList.forEach((element) {
          messageList.add(ChatData.fromJson(element));
        });
      if (messageList.isEmpty) {
      error('');
      isTrendLoading.value = false;
      empty = true;
      print('No messages data available.');
    } else {
      messageModelObj.value = messageList;
      error('');
      isTrendLoading.value = false;
    }
    isTrendLoading.value = false;
  }
  } catch (e) {
    print('Error fetching messages with influencers: $e');
    error('Something went wrong');
    isTrendLoading.value = false;
  }

}


 @override 
  void onClose() { 
  super.onClose();
   messageController.dispose(); 
   socketClient.disconnect();
   } 
 }
