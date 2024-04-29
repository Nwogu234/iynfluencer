import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/controller/chats_influencer_controller.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/widgets/chats_inputz.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/controller/chats_opened_controller.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/widgets/chat_input.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient extends GetxService {
  late IO.Socket socket;
  RxBool isConnected = false.obs;
  Rx<Message?> receivedMessage = Rx<Message?>(null);
  var sentMessages = <Message>[].obs;
  UserController user = Get.find<UserController>();

  // Make SocketClient a singleton
  static SocketClient get to => Get.find();
  var messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initSocket();
  }

  void _initSocket() async {
    // Initialize the socket connection
    var storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    socket = IO.io(
        // 'https://iynf-kong-akbf9.ondigitalocean.app/api/v1/chat-socket:5046',
        'wss://iynf-chat-hgkkb.ondigitalocean.app',
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

    //userJoin event
    socket.on('userJoin', (data) {
      var chatId = data['chatId'];
      var userFirstName = user.userModelObj().firstName;
      if (chatId != null && userFirstName != null) {
        print('User $userFirstName has joined the chat with chat ID: $chatId');
        socket.emit('userJoin', '$userFirstName has joined the chat');
      } else {
        print('Incomplete data received for userJoin event');
      }
    });

    //userLeave event
    socket.on('userLeave', (data) {
      var chatId = data['chatId'];
      var userFirstName = user.userModelObj().firstName;
      if (chatId != null && userFirstName != null) {
        print('User $userFirstName has left the chat with chat ID: $chatId');
        socket.emit('userLeave', '$userFirstName has left the chat');
      } else {
        print('Incomplete data received for userLeave event');
      }
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

  void sendMessage(ChatData chatData, String messageText) {
    // Emit the onMessageCreate event with payload containing text, userId, and chat details
    socket.emit('onMessageCreate', {
      'text': messageText,
      'userId': user.userModelObj().userId,
      'chat': {
        'chatId': chatData.chatId,
        'creatorUserId': chatData.creatorUserId,
        'influencerUserId': chatData.influencerUserId,
      },
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
