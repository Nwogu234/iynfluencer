import 'package:get/get.dart';import 'influencer_home_item_model.dart';/// This class defines the variables used in the [influencer_home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InfluencerHomeModel {Rx<List<InfluencerHomeItemModel>> influencerHomeItemList = Rx(List.generate(3,(index) => InfluencerHomeItemModel()));

 }
