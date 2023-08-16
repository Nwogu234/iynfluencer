import 'package:iynfluencer/core/app_export.dart';
import '../models/influencer_drawer_model.dart';

/// A controller class for the CreatorProfileDraweritem.
///
/// This class manages the state of the CreatorProfileDraweritem, including the
/// current creatorProfileModelObj
class InfluencerDrawerController extends GetxController {
  Rx<InfluencerDrawerModel> influencerProfileModelObj = InfluencerDrawerModel().obs;
}
