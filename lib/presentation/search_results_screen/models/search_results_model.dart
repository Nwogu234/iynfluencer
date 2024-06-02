import 'package:iynfluencer/presentation/search_results_screen/models/recommended_item_model.dart';
import 'package:get/get.dart';/// This class is used in the [recommended_item_widget] screen.

/// This class defines the variables used in the [search_results_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchResultsModel { 
    Rx<List<RecommendedItemModel>> recommendedItemList =
      Rx(List.generate(4, (index) => RecommendedItemModel()));
}
