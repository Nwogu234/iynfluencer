import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/bids_screen/models/bids_model.dart';/// A controller class for the BidsScreen.
///
/// This class manages the state of the BidsScreen, including the
/// current bidsModelObj
class BidsController extends GetxController {Rx<BidsModel> bidsModelObj = BidsModel().obs;

 }
