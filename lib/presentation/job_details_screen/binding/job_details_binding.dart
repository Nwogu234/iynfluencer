import '../controller/job_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the JobDetailsScreen.
///
/// This class ensures that the JobDetailsController is created when the
/// JobDetailsScreen is first loaded.
class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailsController());
  }
}
