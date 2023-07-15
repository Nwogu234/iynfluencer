import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/phone_verification_screen/models/phone_verification_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PhoneVerificationScreen.
///
/// This class manages the state of the PhoneVerificationScreen, including the
/// current phoneVerificationModelObj
class PhoneVerificationController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();

  Rx<PhoneVerificationModel> phoneVerificationModelObj =
      PhoneVerificationModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    phonenumberController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in phoneVerificationModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    phoneVerificationModelObj.value.dropdownItemList.refresh();
  }
}
