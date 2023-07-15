import '../controller/notification_mentions_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationMentionsOneScreen.
///
/// This class ensures that the NotificationMentionsOneController is created when the
/// NotificationMentionsOneScreen is first loaded.
class NotificationMentionsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationMentionsOneController());
  }
}
