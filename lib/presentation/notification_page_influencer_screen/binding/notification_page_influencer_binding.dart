import '../controller/notification_page_influencer_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationPageInfluencerScreen.
///
/// This class ensures that the NotificationPageInfluencerController is created when the
/// NotificationPageInfluencerScreen is first loaded.
class NotificationPageInfluencerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPageInfluencerController());
  }
}
