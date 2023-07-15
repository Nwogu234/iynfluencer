import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/dispute_sent_screen/models/dispute_sent_model.dart';

/// A controller class for the DisputeSentScreen.
///
/// This class manages the state of the DisputeSentScreen, including the
/// current disputeSentModelObj
class DisputeSentController extends GetxController {
  Rx<DisputeSentModel> disputeSentModelObj = DisputeSentModel().obs;
}
