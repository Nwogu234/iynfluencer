import 'package:get/get.dart';import 'messages_page_item_model.dart';/// This class defines the variables used in the [messages_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MessagesModel {Rx<List<MessagesPageItemModel>> messagesPageItemList = Rx(List.generate(4,(index) => MessagesPageItemModel()));

 }
