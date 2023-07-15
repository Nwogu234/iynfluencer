import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/models/home_creator_container_model.dart';

/// A controller class for the HomeCreatorContainerScreen.
///
/// This class manages the state of the HomeCreatorContainerScreen, including the
/// current homeCreatorContainerModelObj
class HomeCreatorContainerController extends GetxController {
  Rx<HomeCreatorContainerModel> homeCreatorContainerModelObj =
      HomeCreatorContainerModel().obs;
}
