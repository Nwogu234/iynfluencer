import 'package:get/get.dart';
import 'package:iynfluencer/presentation/job_hired_screen/controller/job_hired_controller.dart';


class JobHiredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobHiredController());
  }
}
