import '../controller/creator_job_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the JobDetailsScreen.
///
/// This class ensures that the JobDetailsController is created when the
/// JobDetailsScreen is first loaded.
class CreatorJobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorJobDetailsController());
  }
}
