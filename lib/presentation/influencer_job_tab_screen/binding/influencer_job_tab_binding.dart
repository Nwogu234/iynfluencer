import 'package:get/get.dart';
import 'package:iynfluencer/presentation/influencer_job_tab_screen/controller/influencer_job_tab_controller.dart';


class InfluencerJobTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerJobTabController());
  }
}
