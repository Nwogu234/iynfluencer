import '../controller/creator_profile_comm_posts_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreatorProfileCommPostsTabContainerScreen.
///
/// This class ensures that the CreatorProfileCommPostsTabContainerController is created when the
/// CreatorProfileCommPostsTabContainerScreen is first loaded.
class CreatorProfileCommPostsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorProfileCommPostsTabContainerController());
  }
}
