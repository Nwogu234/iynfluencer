import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_profile_draweritem/models/creator_profile_model.dart';

/// A controller class for the CreatorProfileDraweritem.
///
/// This class manages the state of the CreatorProfileDraweritem, including the
/// current creatorProfileModelObj
class CreatorProfileController extends GetxController {
  Rx<CreatorProfileModel> creatorProfileModelObj = CreatorProfileModel().obs;
}
