import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';import 'package:flutter/material.dart';/// A controller class for the BidScreen.
///
/// This class manages the state of the BidScreen, including the
/// current bidModelObj
class BidController extends GetxController {TextEditingController frametwelveController = TextEditingController();

TextEditingController priceController = TextEditingController();

Rx<BidModel> bidModelObj = BidModel().obs;

@override void onClose() { super.onClose(); frametwelveController.dispose(); priceController.dispose(); } 
 }
