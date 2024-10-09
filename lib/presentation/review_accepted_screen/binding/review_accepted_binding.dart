import 'package:get/get.dart';
import 'package:iynfluencer/presentation/review_accepted_screen/controller/review_accepted_controller.dart';
import 'package:iynfluencer/presentation/review_accepted_screen/model/review_model.dart';


class ReviewAcceptedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewAcceptedController());
  }
}
