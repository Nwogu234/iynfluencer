import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/paymentApi.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/presentation/payment_card_screen/models/card_detail.dart';
import 'package:iynfluencer/presentation/payment_card_screen/models/payment_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// A controller class for the PaymentCardScreen.
/// This class manages the state of the PaymentCardScreen, including the
/// current paymentCardModelObj
class PaymentCardController extends GetxController {
  TextEditingController languageController = TextEditingController();

  TextEditingController frame1006Controller = TextEditingController();

  TextEditingController languageoneController = TextEditingController();

  TextEditingController frame1006oneController = TextEditingController();

  Rx<PaymentCardModel> paymentCardModelObj = PaymentCardModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  final paymentClient = PaymentClient();
  final storage = new FlutterSecureStorage();
  var token;
  var error = ''.obs;
  final Stripe stripe = Stripe.instance;

  

  @override
  void onClose() {
    super.onClose();
    languageController.dispose();
    frame1006Controller.dispose();
    languageoneController.dispose();
    frame1006oneController.dispose();
  }
}
