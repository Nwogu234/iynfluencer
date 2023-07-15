import 'package:get/get.dart';import 'bids_item_model.dart';/// This class defines the variables used in the [bids_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BidsModel {Rx<List<BidsItemModel>> bidsItemList = Rx(List.generate(3,(index) => BidsItemModel()));

 }
