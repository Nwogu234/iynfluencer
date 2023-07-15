import '../controller/messages_page_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MessagesPageOneScreen.
///
/// This class ensures that the MessagesPageOneController is created when the
/// MessagesPageOneScreen is first loaded.
class MessagesPageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesPageOneController());
  }
}
