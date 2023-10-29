import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart'as IO;
/// A controller class for the MessagesPage.
///
/// This class manages the state of the MessagesPage, including the
/// current messagesModelObj
class MessagesController extends GetxController {
  MessagesController(this.messagesModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<MessagesModel> messagesModelObj;

  late IO.Socket socket;
  var messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Connect to the socket.io server
    socket = IO.io('http://YOUR_SERVER_ADDRESS', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // Connect
    socket.connect();

    // Handle incoming messages
    socket.on('receive_message', (data) {
      messages.add(data.toString());
      update(); // Trigger a UI refresh with GetX
    });

    // Handle errors (optional)
    socket.on('error', (errorData) {
      print('Socket Error: $errorData');
    });
  }

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      socket.emit('send_message', text);
    }
  }

  @override
  void onClose() {
    socket.disconnect();
    searchController.dispose();
      messagesModelObj.value.messagesPageItemList.value.forEach((element) {
        element.framethreeController.dispose();
      });
    super.onClose();
  }
}

