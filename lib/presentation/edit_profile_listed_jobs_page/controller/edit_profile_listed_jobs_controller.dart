import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_page/models/edit_profile_listed_jobs_model.dart';

/// A controller class for the EditProfileListedJobsPage.
///
/// This class manages the state of the EditProfileListedJobsPage, including the
/// current editProfileListedJobsModelObj
class EditProfileListedJobsController extends GetxController {
  EditProfileListedJobsController(this.editProfileListedJobsModelObj);

  Rx<EditProfileListedJobsModel> editProfileListedJobsModelObj;
}
