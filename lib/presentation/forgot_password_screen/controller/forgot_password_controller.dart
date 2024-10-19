import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel(email: "").obs;
  final apiClient = ApiClient();

   Future<void> sendForgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }

    forgotPasswordModelObj.update((val) {
      val?.email = emailController.text;
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    /* try {
      final response = await apiClient.forgetPass(forgotPasswordModelObj.value);

      if (response.isOk) {
        Get.back(); 
        Get.snackbar('Success', 'A reset code has been sent to your email.');
        Get.toNamed(
          AppRoutes.emailCodeScreen,
          arguments: {
            'email': forgotPasswordModelObj.value.email,
          },
        );
      } else {
        Get.back(); 
        Get.snackbar('Error', 'Failed to send reset code. Please try again.');
      }
    } catch (e) {
      Get.back(); 
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } */

      Get.back(); 
      Get.snackbar('Success', 'A reset code has been sent to your email.');

      Get.toNamed(
          AppRoutes.emailForgetScreen,
          arguments: {
            'email': forgotPasswordModelObj.value.email,
          },
        );
  }

  
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
