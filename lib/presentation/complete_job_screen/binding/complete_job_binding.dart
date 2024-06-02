import 'package:get/get.dart';
import 'package:iynfluencer/presentation/complete_job_screen/controller/complete_job_controller.dart';

/// A binding class for the BidScreen.
///
/// This class ensures that the BidController is created when the
/// BidScreen is first loaded.
class CompleteJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteJobController());
  }
}
