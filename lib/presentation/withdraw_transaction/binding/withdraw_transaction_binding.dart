import 'package:get/get.dart';
import 'package:iynfluencer/presentation/withdraw_transaction/controller/withdraw_transaction_controller.dart';


class WithdrawTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawTransactionController());
  }
}
