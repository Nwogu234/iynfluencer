import '../controller/bids_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BidsScreen.
///
/// This class ensures that the BidsController is created when the
/// BidsScreen is first loaded.
class BidsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BidsController());
  }
}
