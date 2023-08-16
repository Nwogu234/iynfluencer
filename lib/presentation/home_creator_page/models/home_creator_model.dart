import 'package:get/get.dart';

import 'listrectangle50_item_model.dart';/// This class defines the variables used in the [home_creator_page],
import 'trendinghorizon_item_model.dart';
/// and is typically used to hold data that is passed between different parts of the application.
class HomeCreatorModel {

 Rx<List<TrendinghorizonItemModel>> trendinghorizonItemList = Rx(List.generate(4,(index) => TrendinghorizonItemModel()));

Rx<List<Listrectangle50ItemModel>> listrectangle50ItemList = Rx(List.generate(4,(index) => Listrectangle50ItemModel()));

 }
