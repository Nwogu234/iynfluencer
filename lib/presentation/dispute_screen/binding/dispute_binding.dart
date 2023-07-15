import '../controller/dispute_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DisputeScreen.
///
/// This class ensures that the DisputeController is created when the
/// DisputeScreen is first loaded.
class DisputeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DisputeController());
  }
}
