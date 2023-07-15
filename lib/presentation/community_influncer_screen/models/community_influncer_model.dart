import 'package:get/get.dart';import 'body1_item_model.dart';/// This class defines the variables used in the [community_influncer_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CommunityInfluncerModel {Rx<List<Body1ItemModel>> body1ItemList = Rx(List.generate(2,(index) => Body1ItemModel()));

 }
