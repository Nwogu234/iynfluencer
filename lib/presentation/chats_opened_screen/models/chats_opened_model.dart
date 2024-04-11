import 'package:get/get.dart';
import 'package:iynfluencer/presentation/chats_opened_screen/models/body_item_model.dart';
import 'package:iynfluencer/presentation/community_page/models/body_item_model.dart';

/// This class defines the variables used in the [chats_opened_screen],
/// and is typically used to hold data that is passed between different parts of the application.

class ChatsOpenedModel {
  Rx<List<Body5ItemModel>> trendinghorizonItemList =
      Rx(List.generate(4, (index) => Body5ItemModel()));


}

