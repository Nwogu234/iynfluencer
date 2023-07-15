import '../controller/notification_page_client_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationPageClientScreen.
///
/// This class ensures that the NotificationPageClientController is created when the
/// NotificationPageClientScreen is first loaded.
class NotificationPageClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPageClientController());
  }
}
