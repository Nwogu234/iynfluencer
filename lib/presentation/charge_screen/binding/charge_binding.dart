import '../controller/charge_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChargeScreen.
///
/// This class ensures that the ChargeController is created when the
/// ChargeScreen is first loaded.
class ChargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChargeController());
  }
}
