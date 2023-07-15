import 'package:get/get.dart';import 'messages_page1_item_model.dart';/// This class defines the variables used in the [messages_page_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MessagesPageOneModel {Rx<List<MessagesPage1ItemModel>> messagesPage1ItemList = Rx(List.generate(4,(index) => MessagesPage1ItemModel()));

 }
