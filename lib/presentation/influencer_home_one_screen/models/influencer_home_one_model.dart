import 'package:get/get.dart';import 'influencer_home1_item_model.dart';/// This class defines the variables used in the [influencer_home_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InfluencerHomeOneModel {Rx<List<InfluencerHome1ItemModel>> influencerHome1ItemList = Rx(List.generate(3,(index) => InfluencerHome1ItemModel()));

 }
