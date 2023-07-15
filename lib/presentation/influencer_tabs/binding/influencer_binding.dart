import '../contoller/influencers_tabs_controller.dart';

import 'package:get/get.dart';

/// A binding class for the HomeCreatorContainerScreen.
///
/// This class ensures that the HomeCreatorContainerController is created when the
/// HomeCreatorContainerScreen is first loaded.
class InfluencerTabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerTabsController());
  }
}
