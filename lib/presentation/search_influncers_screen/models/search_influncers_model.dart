import 'package:get/get.dart';import 'trending_item_model.dart';/// This class defines the variables used in the [search_influncers_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchInfluncersModel {Rx<List<TrendingItemModel>> trendingItemList = Rx(List.generate(6,(index) => TrendingItemModel()));

 }
