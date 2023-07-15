import '../controller/complete_profile_influencer_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CompleteProfileInfluencerScreen.
///
/// This class ensures that the CompleteProfileInfluencerController is created when the
/// CompleteProfileInfluencerScreen is first loaded.
class CompleteProfileInfluencerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileInfluencerController());
  }
}
