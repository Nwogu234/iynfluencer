import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/presentation/influencer_profile_comm_post_tab_container_screen/controller/influencer_profile_comm_post_hire_modal_controller.dart';
import 'package:iynfluencer/presentation/post_page_screen/models/post_page_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_bottom_bar.dart';
import '../../home_creator_container_screen/controller/home_creator_container_controller.dart';

/// A controller class for the PostPageScreen.
///
/// This class manages the state of the PostPageScreen, including the
/// current postPageModelObj
class PostPageController extends GetxController
    with SingleGetTickerProviderMixin {
  PostPageController(this.postPageModelObj);
  final formKeyMain = GlobalKey<FormState>();
  var storage = FlutterSecureStorage();
  HomeCreatorContainerController homcont =
      Get.put(HomeCreatorContainerController());
  InfluencerProfileCommHireModalContainerController hireJobController =
      Get.put(InfluencerProfileCommHireModalContainerController());

  TextEditingController inputController = TextEditingController();

  TextEditingController frametwelveController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController priceoneController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  TextEditingController durationController = TextEditingController();

  TextEditingController frametwelvetwoController = TextEditingController();
  late AnimationController animationController;
  BottomBarController bumcont = Get.put(BottomBarController());

  // this is for the job category

  Rx<SelectionPopupModel> selectedNiche =
      SelectionPopupModel(id: 0, title: "Select Niche").obs;
  RxList<SelectionPopupModel> nicheToDisplay = RxList<SelectionPopupModel>();
  RxList<SelectionPopupModel> selectedNiches = <SelectionPopupModel>[].obs;

  final List<SelectionPopupModel> dropdownItems = [
    SelectionPopupModel(id: 0, title: "Select Niche"),
    SelectionPopupModel(
        id: 1, title: "Fashion & Style", value: "Fashion & Style"),
    SelectionPopupModel(id: 2, title: "Beauty", value: "Beauty"),
    SelectionPopupModel(
        id: 3, title: "Health & Fitness", value: "Health & Fitness"),
    SelectionPopupModel(id: 4, title: "Travel", value: "Travel"),
    SelectionPopupModel(
        id: 5, title: "Food & Cooking", value: "Food & Cooking"),
    SelectionPopupModel(
        id: 6, title: "Parenting & Family", value: "Parenting & Family"),
    SelectionPopupModel(id: 7, title: "Tech & Gaming", value: "Tech & Gaming"),
    SelectionPopupModel(
        id: 8,
        title: "Home & Interior Design",
        value: "Home & Interior Design"),
    SelectionPopupModel(
        id: 9, title: "Finance & Investment", value: "Finance & Investment"),
    SelectionPopupModel(
        id: 10,
        title: "Entertainment & Celebrity",
        value: "Entertainment & Celebrity"),
    SelectionPopupModel(
        id: 11, title: "Art & DIY Craft", value: "Art & DIY Craft"),
    SelectionPopupModel(
        id: 12,
        title: "Sustainability & Eco-friendly",
        value: "Sustainability & Eco-friendly"),
    SelectionPopupModel(
        id: 13, title: "Education & Career", value: "Education & Career"),
    SelectionPopupModel(
        id: 14, title: "Science & Technology", value: "Science & Technology"),
    SelectionPopupModel(id: 15, title: "Others", value: "Others"),
  ];

//this is to add and remove niches from drop down list

  void onDropdownItemChanged(SelectionPopupModel value) {
    selectedNiche.value = value;
    // Check if the item is not already selected
    if (!selectedNiches.contains(value) &&
        value != SelectionPopupModel(id: 0, title: "Select Niche")) {
      selectedNiches.add(value);
    }
    print("onDropdownItemChanged called");
    print("Added value to selectedDropdownItems: ${value.title}");
    print("Current selectedValue: ${selectedNiche.value.title}");
    nicheToDisplay.value =
        dropdownItems.where((item) => !selectedNiches.contains(item)).toList();
    print(nicheToDisplay.map((item) => item.toString()).toList());
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");
  }

//this is to delete niches clip widget
  handleNicheDelete(SelectionPopupModel platform) {
    selectedNiche.value = nicheToDisplay.last;
    update();
    print(selectedNiche.value.id);
    selectedNiches.remove(platform);
    nicheToDisplay.value = dropdownItems
        .where((item) => !selectedNiches.value.contains(item))
        .toList();
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");
    print(selectedNiche.value.id);
    update();
  }

//this is for adding resposibilities
  Rx<bool> isAddingResponsibility = false.obs;
  final formKey = GlobalKey<FormState>();
  Rx<String> errorText = "".obs;
  var responsibilities = <String>[].obs;
  startAddingResponsibilities() {
    isAddingResponsibility.value = true;
  }

  addResponsibilities(String responsibility) {
    responsibilities.add(responsibility);
    print(responsibility);
    isAddingResponsibility.value = false;
  }

  ///VALIDTAE RESPONSIBILITY LIST
  bool validateResponsibilities() {
    if (responsibilities.isEmpty) {
      errorText.value = 'At least one responsibility must be added!';
      return false;
    } else {
      errorText.value = '';
      return true;
    }
  }

  Rx<PostPageModel> postPageModelObj = PostPageModel().obs;

  handleDelete(String account) {
    responsibilities.remove(account);
    update();
  }

// this is for posting jobs
  var token;
  var error = ''.obs;

  // for media selection
  var selectedMediaFiles = <MediaFile>[].obs;
  // Add a method to add a selected media file
  void addSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.add(mediaFile);
  }

  void UpdateMediaList(MediaFile mediafile) {
    selectedMediaFiles.insert(0, mediafile);
    update();
  }

  // Method to remove a selected media file
  void removeSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.remove(mediaFile);
    update();
  }

  bool validateMediaFiles(List<MediaFile> mediaFiles) {
    // Calculate the total size of all media files in bytes
    int totalSizeBytes = 0;

    for (var mediaFile in mediaFiles) {
      if (mediaFile.file == null) {
        return false; // A file is null
      }

      // Get the size of the file in bytes
      int fileSize = mediaFile.file.lengthSync();
      totalSizeBytes += fileSize; // Add the file size to the total

      // Check if the file size exceeds 25MB (25 * 1024 * 1024 bytes)
      if (fileSize > 25 * 1024 * 1024) {
        return false; // File size exceeds 25MB
      }
    }

    // All validation checks passed
    return true;
  }

  void submitForm(
      BuildContext context, bool fromHire, String? fromHireInfluencerId) async {
    token = await storage.read(key: 'token');
    print("this is running");
    // Validate the media files
    if (!validateMediaFiles(selectedMediaFiles)) {
      // Media file validation failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Media files are invalid or exceed 25 MB total.'),
        ),
      );
      print("media validated");
    }
    if (formKeyMain.currentState!.validate() && validateResponsibilities()) {
      final JobRequest jobRequest = JobRequest(
        title: inputController.text,
        description: frametwelveoneController.text,
        budgetFrom: int.tryParse(priceController.text) ?? 0,
        budgetTo: int.tryParse(priceoneController.text) ?? 0,
        duration: int.tryParse(durationController.text) ?? 0,
        category: selectedNiches.map((item) => item.title).toList(),
        responsibilities: responsibilities,
      );
      final apiClient = ApiClient();
      // Sending it to a server using an API request
      try {
        final response = await apiClient.createJob(jobRequest, token);
        print('-----');
        print(response.body['data']);
        if (response.isOk) {
          if (fromHire) {
            await hireJobController.sendJobRequest(
                response.body['data']['jobId'], fromHireInfluencerId!);
            Get.snackbar(
                'Success', 'Your New Job has been posted and Assigned!');
          } else {
            Get.snackbar('Success', 'Your job has been posted!');
            homcont.currentRoute.value =
                AppRoutes.creatorHireslistTabContainerPage;
            Navigator.of(Get.nestedKey(1)!.currentState!.context)
                .pushReplacementNamed(
                    AppRoutes.creatorHireslistTabContainerPage);
            bumcont.selectedIndex.value = 1;
          }
        } else if (response.statusCode == 400) {
          // Handles bad request errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid data. Please check your input.'),
            ),
          );
        } else if (response.statusCode == 401) {
          // Handle unauthorized errors (e.g., user not authenticated)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unauthorized. Please log in.'),
            ),
          );
        } else {
          // Handle other status codes
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('An error occurred while submitting the form.'),
            ),
          );
        }
      } catch (e) {
        print(e);
        // Handles other API request errors (e.g., network errors)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred while submitting the form.'),
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize animation controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animationController.forward();

    // Define fade-in animation
    // fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(parent: animationController!, curve: Curves.easeIn),
    // );
    nicheToDisplay.value =
        dropdownItems.where((item) => !selectedNiches.contains(item)).toList();
    selectedNiche.value = SelectionPopupModel(id: 0, title: "Select Niche");
  }

  @override
  void onClose() {
    super.onClose();
    homcont.dispose();
    bumcont.dispose();
    animationController.dispose();
    inputController.dispose();
    frametwelveController.dispose();
    priceController.dispose();
    priceoneController.dispose();
    frametwelveoneController.dispose();
    frametwelvetwoController.dispose();
    durationController.dispose();
  }
}
