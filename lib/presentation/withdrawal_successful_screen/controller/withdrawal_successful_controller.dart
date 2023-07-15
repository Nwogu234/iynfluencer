import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/withdrawal_successful_screen/models/withdrawal_successful_model.dart';

/// A controller class for the WithdrawalSuccessfulScreen.
///
/// This class manages the state of the WithdrawalSuccessfulScreen, including the
/// current withdrawalSuccessfulModelObj
class WithdrawalSuccessfulController extends GetxController {
  Rx<WithdrawalSuccessfulModel> withdrawalSuccessfulModelObj =
      WithdrawalSuccessfulModel().obs;
}
