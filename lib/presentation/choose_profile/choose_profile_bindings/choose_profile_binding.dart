import 'package:get/get.dart';
import '../choose_profile_controller/choose_profile_controller.dart';


class ChooseProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseProfileController>(() => ChooseProfileController());
  }
}
