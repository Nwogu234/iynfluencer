import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/job_details_screen/models/job_details_model.dart';/// A controller class for the JobDetailsScreen.
///
/// This class manages the state of the JobDetailsScreen, including the
/// current jobDetailsModelObj
class JobDetailsController extends GetxController {Rx<JobDetailsModel> jobDetailsModelObj = JobDetailsModel().obs;

 }
