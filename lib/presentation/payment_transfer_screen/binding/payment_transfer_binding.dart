import '../controller/payment_transfer_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentTransferScreen.
///
/// This class ensures that the PaymentTransferController is created when the
/// PaymentTransferScreen is first loaded.
class PaymentTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentTransferController());
  }
}
