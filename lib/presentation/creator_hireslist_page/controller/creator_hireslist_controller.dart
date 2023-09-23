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
class CreatorHireslistController extends GetxController {
  CreatorHireslistController(CreatorHireslistModel creatorHireslistModelObj) {
    this.creatorHireslistModelObj =
        Rx<CreatorHireslistModel>(creatorHireslistModelObj);
  }

  Rx<CreatorHireslistModel>? creatorHireslistModelObj;

  final UserController user = Get.find();

  Rx<bool> isLoading = false.obs;
  Rx<bool> isTrendLoading = false.obs;
  Rx<bool> isRecommendedLoading = false.obs;
  final storage = new FlutterSecureStorage();
  var token;
  final apiClient = ApiClient();
  var error = ''.obs;

  RxList<Job> allJobs = <Job>[].obs;
  RxList<Job> hiredJobs = <Job>[].obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in creatorHireslistModelObj!.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    creatorHireslistModelObj!.value.dropdownItemList.refresh();
  }

//this is for animation
  late AnimationController animationController;

  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();
  }

//*animation stops here
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
        isLoading.value = false;
        fetchHiredJobs();
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isLoading.value = false;
    }
  }

  // Fetch all jobs
  Future<void> fetchHiredJobs() async {
    try {
      error('');
      isTrendLoading.value = true;
      final Response response = await apiClient.getAllJobs(1, 15, token);
      if (response.isOk) {
        final List<Job> jobs = (response.body as List)
            .map((jobJson) => Job.fromJson(jobJson))
            .toList();
        allJobs.assignAll(jobs);

        // Filter hired jobs
        hiredJobs.assignAll(allJobs.where((job) => job.hired == true));
      } else {
        error('');
        isTrendLoading.value = false;
      }
    } catch (e) {
      print(e);
      error('Something went wrong');
      isTrendLoading.value = false;
    }
  }

  @override
  void onInit() {
    print('OnInit called');
    getUser();
    super.onInit();
  }
}
