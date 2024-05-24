import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient extends GetxService {
  late IO.Socket socket;
  RxBool isConnected = false.obs;
  RxBool isConnecting = false.obs;
  Rx<Message?> receivedMessage = Rx<Message?>(null);
  var sentMessages = <Message>[].obs;
  UserController user = Get.find<UserController>();
  Timer? keepAliveTimer;

  // Make SocketClient a singleton
  static SocketClient get to => Get.find(); // Singleton pattern for easy access

  @override
  void onInit() {
    super.onInit();
    _initSocket();
  }



  void _initSocket() async {
    // Initialize the socket connection
    var storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    try {
      socket =
          IO.io('wss://iynf-chat-hgkkb.ondigitalocean.app', <String, dynamic>{
        'transports': ['websocket'],
        'extraHeaders': {'authorization': token},
        'autoConnect': true,
        'reconnection': true,
      //  'reconnectionAttempts': 100000,
        'path': '/chat-socket',
        'timeout': 30000000,
        'reconnectionAttempts': null,
        'reconnectionDelay': 1000, 
        'reconnectionDelayMax': 3000,
        'randomizationFactor': 0.5,
      });
      socket.connect();
      connect();
      print(socket.connected);
    } catch (e) {
      Get.log('Socket initialization failed: $e', isError: true);
    }
  }

  void connect() {
    if (!isConnected.value && !isConnecting.value) {
      isConnecting.value = true;
      socket.connect();
      _setupSocketListeners();
    }
  }

  void _setupSocketListeners() {
    socket.onConnect((_) {
      isConnected.value = true;
      isConnecting.value = false;
      print('WEB SOCKET CONNECTED');
      Get.log('WebSocket connected');
    });

    socket.onDisconnect((_) {
      isConnected.value = false;
      print('WEB SOCKET DISCONNECTED');
      Get.log('WebSocket disconnected');
    });

    socket.onError((data) {
      isConnected.value = false;
      isConnecting.value = false;
    });

    socket.onConnectTimeout((data) {
      isConnected.value = false;
      isConnecting.value = false;
      print('WEB SOCKET TIMEOUT');
      Get.log('Socket error: $data', isError: true);
    });
    socket.on('userJoin', (data) => _handleUserEvent(data, "joined"));
    socket.on('userLeave', (data) => _handleUserEvent(data, "left"));
  }
  

  void _handleUserEvent(dynamic data, String eventType) {
    if (data is String) {
     data = json.decode(data);
   }
    var chatId = data['chatId'];
    var userFirstName = user.userModelObj().firstName;
    if (chatId != null && userFirstName != null) {
      Get.log(
          'User $userFirstName has $eventType the chat with chat ID: $chatId');
    } else {
      Get.log('Incomplete data received for $eventType event', isError: true);
    }
  }

  void sendMessage(ChatData chatData, dynamic messageText) {
    if (isConnected.value) {
      try {
        socket.emit('onMessageCreate', {
          'text': messageText,
          'userId': user.userModelObj().userId,
          'chat': {
            'chatId': chatData.chatId,
            'creatorUserId': chatData.creatorUserId,
            'influencerUserId': chatData.influencerUserId,
          },
        });
        Get.log('Message sent: $messageText');
      } catch (e) {
        Get.log('Error sending message: $e', isError: true);
      }
    }
  }

  void disconnect() {
    if (isConnected.value) {
      socket.disconnect();
      isConnected.value = false;
      Get.log('Disconnected');
    }
  }
}
