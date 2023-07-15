import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/withdrawl_failed_screen/models/withdrawl_failed_model.dart';

/// A controller class for the WithdrawlFailedScreen.
///
/// This class manages the state of the WithdrawlFailedScreen, including the
/// current withdrawlFailedModelObj
class WithdrawlFailedController extends GetxController {
  Rx<WithdrawlFailedModel> withdrawlFailedModelObj = WithdrawlFailedModel().obs;
}
