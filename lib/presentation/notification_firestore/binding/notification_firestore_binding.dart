import 'package:get/get.dart';
import 'package:iynfluencer/presentation/notification_firestore/controller/notification_controller.dart';

/// A binding class for the NotificationFirestoreScreen.
///
/// This class ensures that the NotificationController is created when the
/// NotificationFirestoreScreen is first loaded.
class NotificationFirestoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
