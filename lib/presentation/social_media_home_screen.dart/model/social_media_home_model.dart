import 'package:get/get.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/listrectangle50_item_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/trendinghorizon_item_model.dart';

/// This class defines the variables used in the [Fashion_home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SocialMediaHomeModel{
  Rx<List<TrendinghorizonItemModel>> trendinghorizonItemList =
      Rx(List.generate(4, (index) => TrendinghorizonItemModel()));

  Rx<List<Listrectangle50ItemModel>> listrectangle50ItemList =
      Rx(List.generate(4, (index) => Listrectangle50ItemModel()));
}
