import '../controller/withdrawal_successful_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WithdrawalSuccessfulScreen.
///
/// This class ensures that the WithdrawalSuccessfulController is created when the
/// WithdrawalSuccessfulScreen is first loaded.
class WithdrawalSuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawalSuccessfulController());
  }
}
