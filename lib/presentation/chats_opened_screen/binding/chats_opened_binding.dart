import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';

import '../controller/chats_opened_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatsOpenedScreen.
///
/// This class ensures that the ChatsOpenedController is created when the
/// ChatsOpenedScreen is first loaded.
class ChatsOpenedBinding extends Bindings {


      
  @override
  void dependencies() {
    var chatData = Get.arguments as ChatData;  // Retrieve the ChatData passed as an argument
    Get.lazyPut(() => ChatsOpenedController(chatData: chatData));

  }
}
