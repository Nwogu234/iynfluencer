import '../controller/bid_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BidScreen.
///
/// This class ensures that the BidController is created when the
/// BidScreen is first loaded.
class BidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BidController());
  }
}
