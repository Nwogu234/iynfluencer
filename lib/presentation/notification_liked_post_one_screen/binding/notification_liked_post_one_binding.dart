import '../controller/notification_liked_post_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationLikedPostOneScreen.
///
/// This class ensures that the NotificationLikedPostOneController is created when the
/// NotificationLikedPostOneScreen is first loaded.
class NotificationLikedPostOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationLikedPostOneController());
  }
}
