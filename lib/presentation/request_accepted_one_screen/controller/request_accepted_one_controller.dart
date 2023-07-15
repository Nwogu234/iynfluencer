import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/request_accepted_one_screen/models/request_accepted_one_model.dart';

/// A controller class for the RequestAcceptedOneScreen.
///
/// This class manages the state of the RequestAcceptedOneScreen, including the
/// current requestAcceptedOneModelObj
class RequestAcceptedOneController extends GetxController {
  Rx<RequestAcceptedOneModel> requestAcceptedOneModelObj =
      RequestAcceptedOneModel().obs;
}
