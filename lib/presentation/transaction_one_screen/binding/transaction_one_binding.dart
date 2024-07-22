import 'package:get/get.dart';
import 'package:iynfluencer/presentation/transaction_one_screen/controller/transaction_one_controller.dart';

class TransactionOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionOneController());
  }
}
