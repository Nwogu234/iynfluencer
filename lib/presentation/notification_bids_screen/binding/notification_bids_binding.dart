import '../controller/notification_bids_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationBidsScreen.
///
/// This class ensures that the NotificationBidsController is created when the
/// NotificationBidsScreen is first loaded.
class NotificationBidsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationBidsController());
  }
}
