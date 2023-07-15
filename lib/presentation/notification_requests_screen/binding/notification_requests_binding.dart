import '../controller/notification_requests_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationRequestsScreen.
///
/// This class ensures that the NotificationRequestsController is created when the
/// NotificationRequestsScreen is first loaded.
class NotificationRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationRequestsController());
  }
}
