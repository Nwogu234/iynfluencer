import 'package:get/get.dart';
import 'package:iynfluencer/presentation/earning_menu_tab/controller/earning_tab_controller.dart';

class EarningTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EarningsTabController());
  }
}
