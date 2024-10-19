import 'package:get/get.dart';
import 'package:iynfluencer/presentation/reset_password_screen/controller/reset_password_controller.dart';

/// A binding class for the ForgotPasswordScreen.
///
/// This class ensures that the ForgotPasswordController is created when the
/// ForgotPasswordScreen is first loaded.
class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
