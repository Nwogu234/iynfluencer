import '../controller/request_accepted_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestAcceptedOneScreen.
///
/// This class ensures that the RequestAcceptedOneController is created when the
/// RequestAcceptedOneScreen is first loaded.
class RequestAcceptedOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestAcceptedOneController());
  }
}
