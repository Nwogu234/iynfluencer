import 'package:get/get.dart';
import 'package:iynfluencer/presentation/job_accepted_screen/controller/job_accepted_controller.dart';
import 'package:iynfluencer/presentation/review_accepted_screen/controller/review_accepted_controller.dart';


class JobAcceptedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobAcceptedController());
  }
}
