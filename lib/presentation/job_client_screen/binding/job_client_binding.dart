import '../controller/job_client_controller.dart';
import 'package:get/get.dart';

/// A binding class for the JobClientScreen.
///
/// This class ensures that the JobClientController is created when the
/// JobClientScreen is first loaded.
class JobClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobClientController());
  }
}
