import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/payment_succesful_screen/models/payment_succesful_model.dart';

/// A controller class for the PaymentSuccesfulScreen.
///
/// This class manages the state of the PaymentSuccesfulScreen, including the
/// current paymentSuccesfulModelObj
class PaymentSuccesfulController extends GetxController {
  Rx<PaymentSuccesfulModel> paymentSuccesfulModelObj =
      PaymentSuccesfulModel().obs;
}
