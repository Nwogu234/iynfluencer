import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/request_accepted_screen/models/request_accepted_model.dart';

/// A controller class for the RequestAcceptedScreen.
///
/// This class manages the state of the RequestAcceptedScreen, including the
/// current requestAcceptedModelObj
class RequestAcceptedController extends GetxController {
  Rx<RequestAcceptedModel> requestAcceptedModelObj = RequestAcceptedModel().obs;
}
