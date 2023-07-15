import '../controller/chats_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatsScreen.
///
/// This class ensures that the ChatsController is created when the
/// ChatsScreen is first loaded.
class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsController());
  }
}
