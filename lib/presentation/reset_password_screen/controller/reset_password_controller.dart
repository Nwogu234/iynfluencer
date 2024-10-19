import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/presentation/log_in_screen/models/log_in_model.dart';

/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  Rx<bool> isShowPassword = true.obs;

  Rx<LogInModel> resetPasswordModelObj = LogInModel(email: "", password:'').obs;
  final apiClient = ApiClient();

    Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your new password');
      return;
    }

    resetPasswordModelObj.update((val) {
      val?.email = emailController.text;
      val?.password = passwordController.text;
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final response = await apiClient.resetPass(resetPasswordModelObj.value);

      if (response.isOk) {
        Get.back(); 
        Get.snackbar('Success', 'New Password have been updated');
        Get.toNamed(
          AppRoutes.logInScreen,
        );
      } else {
        Get.back(); 
        Get.snackbar('Error', 'Failed to update password. Please try again.');
      }
    } catch (e) {
      Get.back(); 
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } 
  }

  
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
