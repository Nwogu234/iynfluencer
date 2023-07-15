import '../controller/edit_profile_listed_jobs_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditProfileListedJobsTabContainerScreen.
///
/// This class ensures that the EditProfileListedJobsTabContainerController is created when the
/// EditProfileListedJobsTabContainerScreen is first loaded.
class EditProfileListedJobsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileListedJobsTabContainerController());
  }
}
