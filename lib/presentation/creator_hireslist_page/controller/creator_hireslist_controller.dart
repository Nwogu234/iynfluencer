import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_hireslist_page/models/creator_hireslist_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:flutter/material.dart';
import '../../../data/apiClient/api_client.dart';

/// A controller class for the CreatorHireslistPage.
///
/// This class manages the state of the CreatorHireslistPage, including the
/// current creatorHireslistModelObj
class CreatorHireslistController extends GetxController with SingleGetTickerProviderMixin {
  CreatorHireslistController(CreatorHireslistModel creatorHireslistModelObj) {
    this.creatorHireslistModelObj = Rx<CreatorHireslistModel>(creatorHireslistModelObj);
  }

  late Rx<CreatorHireslistModel> creatorHireslistModelObj;
  final UserController user = Get.find();
  RxBool isLoading = false.obs;
  RxBool isTrendLoading = false.obs;
  RxBool isRecommendedLoading = false.obs;
  final storage = FlutterSecureStorage();
  RxnString token = RxnString();
  final apiClient = ApiClient();
  RxString error = ''.obs;
  bool empty = false;

  RxList<Job> allJobs = <Job>[].obs;
  RxList<Job> hiredJobs = <Job>[].obs;

  SelectionPopupModel? selectedDropDownValue;

  void onSelected(dynamic value) {
    for (var element in creatorHireslistModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    creatorHireslistModelObj.value.dropdownItemList.refresh();
  }

  // Animation controller for any animations
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }

  @override
  void onInit() {
    super.onInit();
    initializeAnimationController(this);
    print('OnInit called');
    getUser();
  }

  @override
  void onClose() {
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.dispose();
    super.onClose();
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
  }

  void getUser() async {
    isLoading.value = true;
    error.value = '';
    token.value = await storage.read(key: "token");
    try {
      await user.getUser();
      if (user.userModelObj.value.firstName.isEmpty) {
        error.value = 'Something went wrong';
        isLoading.value = false;
      } else {
        error.value = '';
        isLoading.value = false;
        fetchHiredJobs();
      }
    } catch (e) {
      print(e);
      error.value = 'Something went wrong';
      isLoading.value = false;
    }
  }

  Future<void> fetchHiredJobs() async {
    try {
      error.value = '';
      token.value = await storage.read(key: "token");
      isTrendLoading.value = true;
      Response response = await apiClient.getCreatorJobs(token.value);
      if (response.isOk) {
        final responseJson = response.body;
        final jobResponse = JobResponse.fromJson(responseJson);
        final jobResponseData = responseJson['data']['docs'];
        print(jobResponseData);

        // Filter the jobs based on the hired status
        final List<Job> hiredJob = jobResponse.data.docs!.where((job) => job.hired == true).toList();

        if (hiredJob.isEmpty) {
          print('No hired jobs found.');
          error.value = 'No hired jobs found.';
          empty = true;
        } else {
          hiredJobs.assignAll(hiredJob);
          error.value = '';
        }
      } else {
        print('Error: ${response.statusText}');
        error.value = 'Something went wrong: ${response.statusText}';
      }
    } catch (e) {
      print('Error: $e');
      error.value = 'Something went wrong: $e';
    } finally {
      isTrendLoading.value = false;
    }
  }
}
