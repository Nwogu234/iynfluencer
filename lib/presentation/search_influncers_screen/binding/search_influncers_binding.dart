import '../controller/search_influncers_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchInfluncersScreen.
///
/// This class ensures that the SearchInfluncersController is created when the
/// SearchInfluncersScreen is first loaded.
class SearchInfluncersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchInfluncersController());
  }
}
