
import 'package:get/get.dart';

import '../email_code_controller/email_code_controller.dart';

/// A binding class for the ConfirmCodeScreen.
///
/// This class ensures that the ConfirmCodeController is created when the
/// ConfirmCodeScreen is first loaded.
class EmailCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailCodeController());
  }
}
