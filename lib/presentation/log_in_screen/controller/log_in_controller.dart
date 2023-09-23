import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the LogInScreen.
///
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  var storage = FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final apiClient = ApiClient();
  String message = '';

  Rx<LogInModel> logInModelObj = LogInModel(email: "", password: "").obs;

  Rx<bool> isShowPassword = true.obs;

  Future<void> logIn() async {
    logInModelObj.update((val) {
      val?.email = usernameController.text;
      val?.password = passwordController.text;
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );

    try {
      Response loginResponse = await apiClient.logIn(logInModelObj.value);
      print("This is message reposnde ${loginResponse.body["message"]}");
      message = loginResponse.body['message'].toString();

      if (loginResponse.body['status'].toString() == 'success') {
        Get.back();
        Get.snackbar('Success', 'Login successful!');

        var headers = loginResponse.headers;
        var authorization = headers?['authorization'];
        await storage.write(key: 'token', value: authorization.toString());

        ///the 3 commented line is code to test that the login in process is working as intended
        // await storage.write(key: 'activeProfile', value:null);
        // var test = await storage.read(key: 'test');
        // print(test);
        var activeProfile = await storage.read(key: 'activeProfile');
        print(activeProfile);
        if (activeProfile == null) {
          Get.offNamed(AppRoutes.chooseProfile);
        } else if (activeProfile == 'Creator') {
          Get.offNamed(AppRoutes.homeCreatorContainerScreen);
        } else {
          Get.offNamed(AppRoutes.influencerTabScreen);
        }
      } else {
        print(loginResponse.statusCode);
        Get.back();
        Get.snackbar('Failure',
            'login in failed ${loginResponse.body["message"].toString()}');
      }
    } catch (e) {
      Get.back();
      print(e);
      Get.snackbar('Error', 'Sever interrupted');
    }
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
