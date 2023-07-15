import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/edit_profile_jobs_page/models/edit_profile_jobs_model.dart';

/// A controller class for the EditProfileJobsPage.
///
/// This class manages the state of the EditProfileJobsPage, including the
/// current editProfileJobsModelObj
class EditProfileJobsController extends GetxController {
  EditProfileJobsController(this.editProfileJobsModelObj);

  Rx<EditProfileJobsModel> editProfileJobsModelObj;
}
