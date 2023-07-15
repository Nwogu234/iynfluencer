import '../controller/request_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestDetailScreen.
///
/// This class ensures that the RequestDetailController is created when the
/// RequestDetailScreen is first loaded.
class RequestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestDetailController());
  }
}
