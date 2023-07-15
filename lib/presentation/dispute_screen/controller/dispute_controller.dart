import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/dispute_screen/models/dispute_model.dart';/// A controller class for the DisputeScreen.
///
/// This class manages the state of the DisputeScreen, including the
/// current disputeModelObj
class DisputeController extends GetxController {Rx<DisputeModel> disputeModelObj = DisputeModel().obs;

Rx<String> radioGroup = "".obs;

 }
