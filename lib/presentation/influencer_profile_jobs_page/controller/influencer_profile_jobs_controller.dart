import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/influencer_profile_jobs_page/models/influencer_profile_jobs_model.dart';

/// A controller class for the InfluencerProfileJobsPage.
///
/// This class manages the state of the InfluencerProfileJobsPage, including the
/// current influencerProfileJobsModelObj
class InfluencerProfileJobsController extends GetxController {
  InfluencerProfileJobsController(this.influencerProfileJobsModelObj);

  Rx<InfluencerProfileJobsModel> influencerProfileJobsModelObj;
}
