import '../controller/edit_profile_details_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditProfileDetailsOneScreen.
///
/// This class ensures that the EditProfileDetailsOneController is created when the
/// EditProfileDetailsOneScreen is first loaded.
class EditProfileDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileDetailsOneController());
  }
}
