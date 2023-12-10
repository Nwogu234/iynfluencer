import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient extends GetxService {
  late IO.Socket socket;
  final _isConnected = false.obs;

  // Make SocketClient a singleton
  static SocketClient get to => Get.find();

  @override
  void onInit() {
    var storage =  FlutterSecureStorage();
    var token = storage.read(key: 'token');
    super.onInit();
    _initSocket(token);
  }

  void _initSocket(token) {
    // Initialize the socket connection
    socket = IO.io('ws://iynflu-LoadB-1pJ0mGMH9ZTh-d0b5fad6d49ec68b.elb.us-east-1.amazonaws.com:8000/api/v1/chat-socket', <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {
        'authorization': token,
      },
      'autoConnect': false,
    });

    // Handle different socket events
    socket.onConnect((_) => _isConnected.value = true);
    socket.onDisconnect((_) => _isConnected.value = false);
    socket.on('userJoin', (data) {
      print('user joined');
    });

    socket.on('userLeave', (data) {
      print('user left');
    });

    socket.on('onMessageCreate', (data) {

    });
      // setState(() {
      //   messages.add(data);
      // })};
    // ... Other event handlers
  }

  bool get isConnected => _isConnected.value;

  // Method to connect to the socket
  void connect() {
    if (!_isConnected.value) {
      socket.connect();
      _isConnected.value=true;
    }
  }

  // Method to disconnect from the socket
  void disconnect() {
    if (_isConnected.value) {
      socket.disconnect();
      _isConnected.value=false;
    }
  }




  //this is to listen for messages


// Send and receive message logic goes here
// ...
}
