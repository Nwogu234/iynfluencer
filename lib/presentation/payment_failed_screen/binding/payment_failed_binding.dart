import '../controller/payment_failed_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentFailedScreen.
///
/// This class ensures that the PaymentFailedController is created when the
/// PaymentFailedScreen is first loaded.
class PaymentFailedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentFailedController());
  }
}
