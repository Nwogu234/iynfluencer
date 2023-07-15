import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/payment_failed_screen/models/payment_failed_model.dart';

/// A controller class for the PaymentFailedScreen.
///
/// This class manages the state of the PaymentFailedScreen, including the
/// current paymentFailedModelObj
class PaymentFailedController extends GetxController {
  Rx<PaymentFailedModel> paymentFailedModelObj = PaymentFailedModel().obs;
}
