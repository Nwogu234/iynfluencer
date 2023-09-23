import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/presentation/email_code/email_code.dart';
import 'package:iynfluencer/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final apiClient = ApiClient();

  final isShowPassword = true.obs;
  final isCheckbox = false.obs;

  var signUpModelObj = SignUpModel(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    country:'',
    termsAndConditions: false,
  ).obs;

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  var storage = FlutterSecureStorage();

  Future<void> signUp() async {
    signUpModelObj.update((val) {
      val?.firstName = firstnameController.text;
      val?.lastName = lastnameController.text;
      val?.email = emailController.text;
      val?.password = passwordController.text;
      val?.country=countryController.text;
      val?.termsAndConditions = isCheckbox.value;
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );

    try {
      Response loginResponse = await apiClient.signUp(signUpModelObj.value);
      var headers = loginResponse.headers;
      var authorization = headers?['authorization'];

      if (loginResponse.body['status'].toString() == 'success') {
        Get.back();
        Get.snackbar('Success', 'Sign up successful!');
        await storage.write(key: 'token', value: authorization.toString());
        print(authorization);
        print(signUpModelObj.value.email);
        Get.toNamed(
          AppRoutes.emailCodeScreen,
          arguments: {
            'email': signUpModelObj.value.email,
            'code': '0000',
          },
        );
      } else {
        print(loginResponse.statusCode);
        Get.back();
        Get.snackbar(
            'Failure', 'Sign up failed! ${loginResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error', 'Something went wrong during sign up.');
    }
  }
}
