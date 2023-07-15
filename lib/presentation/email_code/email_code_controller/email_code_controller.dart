import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/confirm_code_screen/models/confirm_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the ConfirmCodeScreen.
///
/// This class manages the state of the ConfirmCodeScreen, including the
/// current confirmCodeModelObj
class EmailCodeController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<ConfirmCodeModel> confirmCodeModelObj = ConfirmCodeModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
