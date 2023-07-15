import '../controller/payment_succesful_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentSuccesfulScreen.
///
/// This class ensures that the PaymentSuccesfulController is created when the
/// PaymentSuccesfulScreen is first loaded.
class PaymentSuccesfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSuccesfulController());
  }
}
