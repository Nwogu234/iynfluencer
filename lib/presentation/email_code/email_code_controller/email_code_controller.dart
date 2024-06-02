import 'package:email_otp/email_otp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/presentation/confirm_code_screen/models/confirm_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../sign_up_screen/models/sign_up_model.dart';

/// A controller class for the ConfirmCodeScreen.
///
/// This class manages the state of the ConfirmCodeScreen, including the
/// current confirmCodeModelObj
class EmailCodeController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<ConfirmCodeModel> confirmCodeModelObj = ConfirmCodeModel().obs;
  EmailOTP myauth = EmailOTP();
  RxBool sendingOtp = true.obs;
  String email="";
  var arguments;
  ApiClient apiClient = ApiClient();
  FlutterSecureStorage storage = FlutterSecureStorage();

  void sendOtp(String email) async {
    myauth.setConfig(
      appEmail: "unwogu234@gmail.com",
      appName: "Email OTP",
      userEmail: email,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );

    if (await myauth.sendOTP() == true) {
      sendingOtp.value = false;
        Get.snackbar("Success", "OTP has been sent");

    } else {
      sendingOtp.value = false;
        Get.snackbar("Oops", "OTP send failed");
    }
  }



  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    arguments = Get.arguments as Map<String, dynamic>;
    email = arguments['email'];
    sendOtp(email);
    super.onInit();
    listenForCode();
  }
}
