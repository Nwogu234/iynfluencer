import '../controller/search_creator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchCreatorScreen.
///
/// This class ensures that the SearchCreatorController is created when the
/// SearchCreatorScreen is first loaded.
class SearchCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchCreatorController());
  }
}
