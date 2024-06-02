import 'package:get/get.dart';
import 'package:iynfluencer/presentation/community_page/models/body_item_model.dart';/// This class defines the variables used in the [community_page],
/// and is typically used to hold data that is passed between different parts of the application.
class InfluencerProfileCommunityModel {Rx<List<BodyItemModel>> bodyItemList = Rx(List.generate(3,(index) => BodyItemModel()));

 }
