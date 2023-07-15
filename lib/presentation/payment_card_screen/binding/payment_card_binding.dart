import '../controller/payment_card_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentCardScreen.
///
/// This class ensures that the PaymentCardController is created when the
/// PaymentCardScreen is first loaded.
class PaymentCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentCardController());
  }
}
