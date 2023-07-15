import '../controller/community_influncer_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CommunityInfluncerScreen.
///
/// This class ensures that the CommunityInfluncerController is created when the
/// CommunityInfluncerScreen is first loaded.
class CommunityInfluncerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityInfluncerController());
  }
}
