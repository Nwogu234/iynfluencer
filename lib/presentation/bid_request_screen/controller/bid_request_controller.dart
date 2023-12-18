import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/presentation/bid_request_screen/models/bid_request_model.dart';

/// A controller class for the BidRequestScreen.
///
/// This class manages the state of the BidRequestScreen, including the
/// current bidRequestModelObj
class BidRequestController extends GetxController {
  Rx<BidRequestModel> bidRequestModelObj = BidRequestModel().obs;

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();

  final apiClient = ApiClient();
  var error = ''.obs;

  Future<void> hireInfluencerFunc(String bidId) async {
    var token = await storage.read(key: "token");
    try {
      error('');
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      Response response = await apiClient.hireInfluencerForAJob(bidId, token);
      if (response.isOk) {
        if (response.body['data']['status'] == true) {
          Get.back();
          Get.snackbar('Success', 'Influencer Hired');
        }
      }
      Get.back();
      isTrendLoading.value = false;
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error', 'Something went wrong');
      error('Something went wrong');
      isError.value = true;
      isTrendLoading.value = false;
    }
  }

  @override
  void onInit() {
    print('OnInit called');

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // searchController.dispose();
  }
}
