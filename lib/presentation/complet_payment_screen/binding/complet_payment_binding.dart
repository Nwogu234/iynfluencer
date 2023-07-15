import '../controller/complet_payment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CompletPaymentScreen.
///
/// This class ensures that the CompletPaymentController is created when the
/// CompletPaymentScreen is first loaded.
class CompletPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompletPaymentController());
  }
}
