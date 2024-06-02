import 'package:iynfluencer/presentation/search_creator_screen/models/search_creator_model.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/models/search_influncers_model.dart';

import '../controller/search_influncers_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchInfluncersScreen.
///
/// This class ensures that the SearchInfluncersController is created when the
/// SearchInfluncersScreen is first loaded.
class SearchInfluncersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchInfluncersController(SearchInfluncersModel().obs));
  }
}
