import '../controller/withdrawal_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WithdrawalScreen.
///
/// This class ensures that the WithdrawalController is created when the
/// WithdrawalScreen is first loaded.
class WithdrawalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawalController());
  }
}
