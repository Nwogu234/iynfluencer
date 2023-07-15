import '../controller/edit_profile_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditProfileDetailsScreen.
///
/// This class ensures that the EditProfileDetailsController is created when the
/// EditProfileDetailsScreen is first loaded.
class EditProfileDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileDetailsController());
  }
}
