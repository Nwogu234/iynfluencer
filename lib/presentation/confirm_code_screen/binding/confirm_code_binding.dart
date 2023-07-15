import '../controller/confirm_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ConfirmCodeScreen.
///
/// This class ensures that the ConfirmCodeController is created when the
/// ConfirmCodeScreen is first loaded.
class ConfirmCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmCodeController());
  }
}
