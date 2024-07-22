import 'package:get/get.dart';
import 'package:iynfluencer/presentation/transactions_screen/controller/transaction_controller.dart';


class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }
}
