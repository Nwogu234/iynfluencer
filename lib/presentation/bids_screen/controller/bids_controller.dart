import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/presentation/bids_screen/models/bids_model.dart';

/// A controller class for the BidsScreen.
///
/// This class manages the state of the BidsScreen, including the
/// current bidsModelObj
class BidsController extends GetxController {
  Rx<BidsModel> bidsModelObj = BidsModel().obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isError = false.obs;
  var error = ''.obs;

  final UserController user = Get.find();

  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  List<JobBids> allJobBids = <JobBids>[].obs;

  getUser(String? id) async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    print(token);
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        isLoading.value = false;
        getAllJobsBids(id!);
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  //this is to get the list of jobs
  getAllJobsBids(String jobId) async {
    Response response;
    try {
      error('');
      isLoading.value = true;
      response = await apiClient.getAllBidsForAJob(jobId, token);
      print(response.body);
      if (response.isOk) {
        final responseJson = response.body;
        List<dynamic> dd = responseJson['data']['bids'];
        if (dd.length > 0) {
          dd.forEach((e) {
            allJobBids.add(JobBids.fromJson(e));
          });
        }
        if (allJobBids.isEmpty) {
          error('No Job Bids');
        }
        // List of Influencers

        isLoading.value = false;
      } else {
        error('Something went wrong');
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isError.value = true;
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    print('OnInit called');
    getUser(Get.parameters['id']);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // searchController.dispose();
    // animationController.dispose();
  }
}
