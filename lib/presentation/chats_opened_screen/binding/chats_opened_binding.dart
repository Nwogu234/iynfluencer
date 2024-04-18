import 'package:iynfluencer/data/models/messages/chatmodel.dart';

import '../controller/chats_opened_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatsOpenedScreen.
///
/// This class ensures that the ChatsOpenedController is created when the
/// ChatsOpenedScreen is first loaded.
class ChatsOpenedBinding extends Bindings {

   ChatData chatData = ChatData(
      id: 'id',
      creatorId: 'CreatorId',
      creatorUserId: 'CreatorUserId',
      influencerId: 'InfluencerId',
      influencerUserId: 'defaultInfluencerUserId',
      unreadByCreator: 0,
      unreadByInfluencer: 0,
      blockedByCreator: false,
      blockedByInfluencer: false,
      chatId: 'defaultChatId',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: const []);
      
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsOpenedController(
      chatData: chatData
    ));
  }
}
