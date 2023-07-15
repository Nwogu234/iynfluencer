import '../controller/notification_mentions_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationMentionsScreen.
///
/// This class ensures that the NotificationMentionsController is created when the
/// NotificationMentionsScreen is first loaded.
class NotificationMentionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationMentionsController());
  }
}
