import '../controller/chats_opened_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatsOpenedOneScreen.
///
/// This class ensures that the ChatsOpenedOneController is created when the
/// ChatsOpenedOneScreen is first loaded.
class ChatsOpenedOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsOpenedOneController());
  }
}
