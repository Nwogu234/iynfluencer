import '../controller/community_post_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CommunityPostScreen.
///
/// This class ensures that the CommunityPostController is created when the
/// CommunityPostScreen is first loaded.
class CommunityPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityPostController());
  }
}
