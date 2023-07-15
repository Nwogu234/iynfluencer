import 'package:get/get.dart';import 'earnings_item_model.dart';/// This class defines the variables used in the [earnings_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EarningsModel {Rx<List<EarningsItemModel>> earningsItemList = Rx(List.generate(4,(index) => EarningsItemModel()));

 }
