import '../controller/earnings_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EarningsScreen.
///
/// This class ensures that the EarningsController is created when the
/// EarningsScreen is first loaded.
class EarningsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EarningsController());
  }
}
