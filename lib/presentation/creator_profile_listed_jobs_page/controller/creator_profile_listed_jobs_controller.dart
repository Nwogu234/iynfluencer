import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_profile_listed_jobs_page/models/creator_profile_listed_jobs_model.dart';

/// A controller class for the CreatorProfileListedJobsPage.
///
/// This class manages the state of the CreatorProfileListedJobsPage, including the
/// current creatorProfileListedJobsModelObj
class CreatorProfileListedJobsController extends GetxController {
  CreatorProfileListedJobsController(this.creatorProfileListedJobsModelObj);

  Rx<CreatorProfileListedJobsModel> creatorProfileListedJobsModelObj;
}
