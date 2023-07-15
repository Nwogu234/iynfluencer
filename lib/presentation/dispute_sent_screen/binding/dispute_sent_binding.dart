import '../controller/dispute_sent_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DisputeSentScreen.
///
/// This class ensures that the DisputeSentController is created when the
/// DisputeSentScreen is first loaded.
class DisputeSentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DisputeSentController());
  }
}
