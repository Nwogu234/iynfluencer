import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/widgets/chats_inputz.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient extends GetxService {
  late IO.Socket socket;
  RxBool isConnected = false.obs;

  // Make SocketClient a singleton
  static SocketClient get to => Get.find();
  var messages = <String>[].obs;
   static ChatsOpenedController chatsOpenedController =
  Get.find<ChatsOpenedController>();
   static ChatsInfluencerController chatsInfluencerController =
  Get.find<ChatsInfluencerController>();
   static ChatsInputController chatsInputController =
  Get.find<ChatsInputController>();
   static ChatsInputsController chatsInputsController =
  Get.find<ChatsInputsController>();


  @override
  void onInit() {
    super.onInit();
    _initSocket();
  }


  void _initSocket() async{
    // Initialize the socket connection
    var storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    socket = IO.io(
     // 'https://iynf-kong-akbf9.ondigitalocean.app/api/v1/chat-socket:5046',
     'wss://iynf-chat-hgkkb.ondigitalocean.app:5046', 
        <String, dynamic>{
          'transports': ['websocket'],
          'extraHeaders': {
            'authorization': token,
          },
          'autoConnect': false,
        });

    // Handle different socket events
    socket.onConnect((_) => isConnected.value = true);
    socket.onDisconnect((_) => isConnected.value = false);
    socket.on('userJoin', (data) {
      print('user joined');
    });

    socket.on('userLeave', (data) {
      print('user left');
    });

    socket.on('onMessageCreate', (data) {
      messages.add(data.toString());
    });
    
  }

  bool get hasConnected => isConnected.value;

  // Method to connect to the socket
  void connect() {
    if (!isConnected.value) {
      socket.connect();
      print(socket.connected);
      isConnected.value = true;
      print('connected');
    }
  }

  // Method to disconnect from the socket
  void disconnect() {
    if (isConnected.value) {
      socket.disconnect();
      isConnected.value = false;
    }
  }

   // Method to send a message
  void sendMessage(String message) {
    if (isConnected.value) {
      socket.emit('message.create', message);
      print('Sent message: $message');
    } else {
      print('Socket is not connected');
    }
  }

  // Method to handle received messages
  void handleReceivedMessage() {
    socket.on('receiveMessage', (data) {
      messages.add(data.toString());
    });
  }

   // listen to connection status
  void listenToConnectionStatus() {
  socket.onConnect((_) {
    // WebSocket connected
    isConnected.value = true;
  });

  socket.onDisconnect((_) {
    // WebSocket disconnected
    isConnected.value = false;
  });
}
}

