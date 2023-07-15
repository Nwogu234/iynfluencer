import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/models/home_creator_container_model.dart';

import '../models/influencer_tab_model.dart';

/// A controller class for the HomeCreatorContainerScreen.
///
/// This class manages the state of the HomeCreatorContainerScreen, including the
/// current homeCreatorContainerModelObj
class InfluencerTabsController extends GetxController {
  Rx<InfluencerTabsModel> influencerTabsModelObj =
      InfluencerTabsModel().obs;
}