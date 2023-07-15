import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/job_client_screen/models/job_client_model.dart';/// A controller class for the JobClientScreen.
///
/// This class manages the state of the JobClientScreen, including the
/// current jobClientModelObj
class JobClientController extends GetxController {Rx<JobClientModel> jobClientModelObj = JobClientModel().obs;

 }
