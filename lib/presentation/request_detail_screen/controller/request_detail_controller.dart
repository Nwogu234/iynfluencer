import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/request_detail_screen/models/request_detail_model.dart';

/// A controller class for the RequestDetailScreen.
///
/// This class manages the state of the RequestDetailScreen, including the
/// current requestDetailModelObj
class RequestDetailController extends GetxController {
  Rx<RequestDetailModel> requestDetailModelObj = RequestDetailModel().obs;
  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;

  getUser() async {
    isLoading.value = true;
    error('');

    try {
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

// List<JobsMyBidsInfluencerModel>
  Future<void> declineRequest(String id) async {
    try {
      var tk = await storage.read(key: "token");
      await user.getUser();

      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');

        isTrendLoading.value = true;
        Response response =
            await apiClient.InfluencerDeclineJobsRequests(tk, id);
        List<dynamic> jobJsonList = response.body['data'];
        print('=====jobJsonList length====');

        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error', 'Something went wrong');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }
}
