import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/earnings_screen/models/earnings_item_model.dart';
import 'package:iynfluencer/presentation/earnings_screen/models/earnings_model.dart';

/// A controller class for the EarningsScreen.
///
/// This class manages the state of the EarningsScreen, including the
/// current earningsModelObj
class EarningsController extends GetxController {
  Rx<EarningsModel> earningsModelObj = EarningsModel().obs;

  Rx<List<EarningsItemModel>> earningsItemList =
      Rx(List.generate(4, (index) => EarningsItemModel()));

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // searchController.dispose();
    // animationController.dispose();
  }
}
