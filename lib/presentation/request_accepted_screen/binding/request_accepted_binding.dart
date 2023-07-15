import '../controller/request_accepted_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestAcceptedScreen.
///
/// This class ensures that the RequestAcceptedController is created when the
/// RequestAcceptedScreen is first loaded.
class RequestAcceptedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestAcceptedController());
  }
}
