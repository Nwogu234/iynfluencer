import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/presentation/earnings_screen/models/earnings_model.dart';

class EarningsTabController extends GetxController {
  Rx<EarningsModel> earningsModelObj = EarningsModel().obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isEpty = false.obs;
  final UserController user = Get.find();
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;
  List<Jobz> existingJobs = [];

  getUser() async {
    isLoading.value = true;
    error('');
    token = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error('Something went wrong');
        isLoading.value = false;
      } else {
        error('');
        getInfluencerJobJobs(user.userModelObj.value.influencerId ?? '')
            .then((value) {
          isLoading.value = false;
        }).catchError((err) {
          isLoading.value = false;
        });
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  Future<void> getInfluencerJobJobs(String influencerId) async {
    try {
      error('');
      isTrendLoading.value = true;
      Response response =
          await apiClient.getInfluencerAllJobs(influencerId, token);
      if (response.isOk) {
        List<dynamic> dd = response.body['docs'];
        existingJobs.clear();
        dd.forEach((element) {
          existingJobs.add(Jobz.fromJson(element));
        });
        if (existingJobs.isEmpty) {
          error('');
          isEpty.value = true;
          isTrendLoading.value = false;
        } else {
          earningsModelObj.value.earningsItemList.value = existingJobs;
          error('');
          isTrendLoading.value = false;
        }
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  
  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }


  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
