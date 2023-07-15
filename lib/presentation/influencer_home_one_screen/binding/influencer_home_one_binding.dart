import '../controller/influencer_home_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InfluencerHomeOneScreen.
///
/// This class ensures that the InfluencerHomeOneController is created when the
/// InfluencerHomeOneScreen is first loaded.
class InfluencerHomeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerHomeOneController());
  }
}
