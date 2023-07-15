import 'package:get/get.dart';import 'appbar_item_model.dart';/// This class is used in the [body_item_widget] screen.
class BodyItemModel {Rx<List<AppbarItemModel>> appbarItemList = Rx(List.generate(3,(index) => AppbarItemModel()));

Rx<String>? id = Rx("");

 }
