import 'package:get/get.dart';import 'trending_item_model.dart';/// This class defines the variables used in the [search_influncers_screen],

class  SearchInfluncersModel  {
  Rx<List<TrendingItemModel>> trendinghorizonItemList =
      Rx(List.generate(4, (index) => TrendingItemModel()));

}
