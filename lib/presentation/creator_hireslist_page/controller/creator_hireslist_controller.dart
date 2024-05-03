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
  bool empty = false;

//  RxList<Job> allJobs = <Job>[].obs;
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

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 1));
    getUser();
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


  Future<void> fetchHiredJobs() async {
    try {
      error('');
      token = await storage.read(key: "token");
      isTrendLoading.value = true;
      Response response = await apiClient.getCreatorJobs(token);

      if (response.isOk) {
        final responseJson = response.body;
        final jobResponse = JobResponse.fromJson(responseJson);
        final jobResponseData = responseJson['data']['docs'];
        print(jobResponseData);

        // Filter the jobs based on the hired status
        final List<Job> hiredJob =
            jobResponse.data.docs.where((job) => job.hired == true).toList();

        if (hiredJob.isEmpty) {
          print('No hired jobs found.');
          error('No hired jobs found.');
          empty = true;
        } else {
          // Convert List<Job> to RxList<Job>
          hiredJobs.assignAll(hiredJob);
          error('');
        }
      } else {
        print('Error: ${response.statusText}');
        error('Something went wrong: ${response.statusText}');
      }
    } catch (e) {
      print('Error: $e');
      error('Something went wrong: $e');
    } finally {
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
