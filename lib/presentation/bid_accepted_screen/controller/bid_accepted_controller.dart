import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/bid_accepted_screen/models/bid_accepted_model.dart';

/// A controller class for the RequestAcceptedScreen.
///
/// This class manages the state of the RequestAcceptedScreen, including the
/// current requestAcceptedModelObj
class BidAcceptedController extends GetxController {
  Rx<BidAcceptedModel> bidAcceptedModelObj = BidAcceptedModel().obs;
}
