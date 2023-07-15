import 'package:get/get.dart';import 'notificationbid_item_model.dart';/// This class defines the variables used in the [notification_bids_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationBidsModel {Rx<List<NotificationbidItemModel>> notificationbidItemList = Rx(List.generate(2,(index) => NotificationbidItemModel()));

 }
