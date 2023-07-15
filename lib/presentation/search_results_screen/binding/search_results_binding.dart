import '../controller/search_results_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchResultsScreen.
///
/// This class ensures that the SearchResultsController is created when the
/// SearchResultsScreen is first loaded.
class SearchResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultsController());
  }
}
