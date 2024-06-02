import 'package:iynfluencer/core/app_export.dart';

import '../models/settings_model.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current SettingsModelObj
class SettingsController extends GetxController {
  Rx<SettingsModel> SettingsModelObj =
      SettingsModel().obs;


}
