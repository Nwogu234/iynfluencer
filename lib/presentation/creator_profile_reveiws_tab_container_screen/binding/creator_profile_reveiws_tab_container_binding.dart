import '../controller/creator_profile_reveiws_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreatorProfileReveiwsTabContainerScreen.
///
/// This class ensures that the CreatorProfileReveiwsTabContainerController is created when the
/// CreatorProfileReveiwsTabContainerScreen is first loaded.
class CreatorProfileReveiwsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorProfileReveiwsTabContainerController());
  }
}
