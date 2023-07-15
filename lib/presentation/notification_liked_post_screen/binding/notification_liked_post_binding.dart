import '../controller/notification_liked_post_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationLikedPostScreen.
///
/// This class ensures that the NotificationLikedPostController is created when the
/// NotificationLikedPostScreen is first loaded.
class NotificationLikedPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationLikedPostController());
  }
}
