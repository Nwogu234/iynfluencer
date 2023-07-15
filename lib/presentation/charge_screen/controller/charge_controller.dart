import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/charge_screen/models/charge_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChargeScreen.
///
/// This class manages the state of the ChargeScreen, including the
/// current chargeModelObj
class ChargeController extends GetxController {TextEditingController frametwelveController = TextEditingController();

TextEditingController priceController = TextEditingController();

Rx<ChargeModel> chargeModelObj = ChargeModel().obs;

@override void onClose() { super.onClose(); frametwelveController.dispose(); priceController.dispose(); } 
 }
