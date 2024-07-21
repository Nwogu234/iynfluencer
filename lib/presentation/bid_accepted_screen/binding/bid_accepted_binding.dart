import 'package:get/get.dart';
import 'package:iynfluencer/presentation/bid_accepted_screen/controller/bid_accepted_controller.dart';


class BidAcceptedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BidAcceptedController());
  }
}
