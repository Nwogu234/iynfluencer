import '../controller/bid_request_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BidRequestScreen.
///
/// This class ensures that the BidRequestController is created when the
/// BidRequestScreen is first loaded.
class BidRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BidRequestController());
  }
}
