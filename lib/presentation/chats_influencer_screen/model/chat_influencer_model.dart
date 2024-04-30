import 'package:get/get.dart';
import 'package:iynfluencer/presentation/chats_influencer_screen/model/stem_item_model.dart';

/// This class defines the variables used in the [chats_opened_screen],
/// and is typically used to hold data that is passed between different parts of the application.

class ChatsInfluencerModel {
  Rx<List<StemItemModel>> trendinghorizonItemList =
      Rx(List.generate(4, (index) => StemItemModel()));


}
