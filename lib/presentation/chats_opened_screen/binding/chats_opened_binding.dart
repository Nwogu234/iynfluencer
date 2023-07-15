import '../controller/chats_opened_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatsOpenedScreen.
///
/// This class ensures that the ChatsOpenedController is created when the
/// ChatsOpenedScreen is first loaded.
class ChatsOpenedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsOpenedController());
  }
}
