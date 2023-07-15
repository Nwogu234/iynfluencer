import '../controller/withdrawl_failed_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WithdrawlFailedScreen.
///
/// This class ensures that the WithdrawlFailedController is created when the
/// WithdrawlFailedScreen is first loaded.
class WithdrawlFailedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawlFailedController());
  }
}
