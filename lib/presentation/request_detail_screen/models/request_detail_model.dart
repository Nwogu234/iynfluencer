import 'package:get/get.dart';import 'request_detail_item_model.dart';/// This class defines the variables used in the [request_detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RequestDetailModel {Rx<List<RequestDetailItemModel>> requestDetailItemList = Rx(List.generate(2,(index) => RequestDetailItemModel()));

 }
