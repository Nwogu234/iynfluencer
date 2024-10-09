import 'package:iynfluencer/presentation/bid_screen/models/bid_model.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/presentation/edit_bid_screen/controller/edit_bid_controller.dart';

/// A binding class for the BidScreen.
///
/// This class ensures that the BidController is created when the
/// BidScreen is first loaded.
class EditBidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditBidController(BidModel().obs));
  }
}
