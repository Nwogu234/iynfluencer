import '../controller/influencer_profile_comm_post_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InfluencerProfileCommPostTabContainerScreen.
///
/// This class ensures that the InfluencerProfileCommPostTabContainerController is created when the
/// InfluencerProfileCommPostTabContainerScreen is first loaded.
class InfluencerProfileCommPostTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerProfileCommPostTabContainerController());
  }
}
