import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/withdrawal_screen/models/withdrawal_model.dart';import 'package:flutter/material.dart';/// A controller class for the WithdrawalScreen.
///
/// This class manages the state of the WithdrawalScreen, including the
/// current withdrawalModelObj
class WithdrawalController extends GetxController {TextEditingController frame1006Controller = TextEditingController();

Rx<WithdrawalModel> withdrawalModelObj = WithdrawalModel().obs;

Rx<bool> isSelectedSwitch = false.obs;

@override void onClose() { super.onClose(); frame1006Controller.dispose(); } 
 }
