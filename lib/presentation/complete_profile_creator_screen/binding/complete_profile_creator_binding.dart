import '../controller/complete_profile_creator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CompleteProfileCreatorScreen.
///
/// This class ensures that the CompleteProfileCreatorController is created when the
/// CompleteProfileCreatorScreen is first loaded.
class CompleteProfileCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileCreatorController());
  }
}
