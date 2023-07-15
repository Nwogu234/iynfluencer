import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/payment_transfer_screen/models/payment_transfer_model.dart';import 'package:flutter/material.dart';/// A controller class for the PaymentTransferScreen.
///
/// This class manages the state of the PaymentTransferScreen, including the
/// current paymentTransferModelObj
class PaymentTransferController extends GetxController {TextEditingController mobilenoController = TextEditingController();

TextEditingController frame1006Controller = TextEditingController();

TextEditingController frame1006oneController = TextEditingController();

Rx<PaymentTransferModel> paymentTransferModelObj = PaymentTransferModel().obs;

@override void onClose() { super.onClose(); mobilenoController.dispose(); frame1006Controller.dispose(); frame1006oneController.dispose(); } 
 }
