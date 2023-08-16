import 'dart:io';
import 'package:iynfluencer/data/apiClient/api_client.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the CompleteProfileCreatorScreen.
///
/// This class manages the state of the CompleteProfileCreatorScreen, including the
/// current completeProfileCreatorModelObj

class CompleteProfileCreatorController extends GetxController {
  TextEditingController bio = TextEditingController();
  TextEditingController frametwelveoneController = TextEditingController();
  TextEditingController frametwelvetwoController = TextEditingController();
  TextEditingController frametwelveController1 = TextEditingController();
  final apiClient = ApiClient();

  Rx<CompleteProfileCreatorModel> completeProfileCreatorModelObj =
      CompleteProfileCreatorModel(bio: "", niches: []).obs;

  Rxn<File> profileImage = Rxn<File>(); // Add this
  var storage = FlutterSecureStorage();

  RxList<SelectionPopupModel> itemsToDisplay = RxList<SelectionPopupModel>();

  RxList<SelectionPopupModel> dropdownItems = [
    SelectionPopupModel(id: 0, title: "Select Niche"),
    SelectionPopupModel(id: 1, title: "Fashion & Style"),
    SelectionPopupModel(id: 2, title: "Beauty"),
    SelectionPopupModel(id: 3, title: "Health & Fitness"),
    SelectionPopupModel(id: 4, title: "Travel"),
    SelectionPopupModel(id: 5, title: "Food & Cooking"),
    SelectionPopupModel(id: 6, title: "Parenting & Family"),
    SelectionPopupModel(
      id: 7,
      title: "Tech & Gaming",
    ),
    SelectionPopupModel(id: 8, title: "Home & Interior Design"),
    SelectionPopupModel(id: 9, title: "Finance & Investment"),
    SelectionPopupModel(id: 10, title: "Entertainment & Celebrity"),
    SelectionPopupModel(id: 11, title: "Art & DIY Craft"),
    SelectionPopupModel(id: 12, title: "Sustainability & Eco-friendly"),
    SelectionPopupModel(id: 13, title: "Education & Career"),
    SelectionPopupModel(id: 14, title: "Science & Technology"),
    SelectionPopupModel(id: 15, title: "Others"),
  ].obs;
  Rx<SelectionPopupModel> selectedValue =
      SelectionPopupModel(id: 0, title: "None", value: null, isSelected: false)
          .obs;
  RxString errorText="".obs;

  RxList<SelectionPopupModel> selectedDropdownItems =
      <SelectionPopupModel>[].obs;
///this is called onChange in the drop down
  void onDropdownItemChanged(SelectionPopupModel value) {
    selectedValue.value = value;
    // Check if the item is not already selected
    if (!selectedDropdownItems.contains(value) &&
        value != SelectionPopupModel(id: 0, title: "Select Niche")) {
      selectedDropdownItems.add(value);
    }
    print("onDropdownItemChanged called");
    print("Added value to selectedDropdownItems: ${value.title}");
    print("Current selectedValue: ${selectedValue.value.title}");
    itemsToDisplay.value = dropdownItems.value
        .where((item) => !selectedDropdownItems.contains(item))
        .toList();
    print(itemsToDisplay.map((item) => item.toString()).toList());
    selectedValue.value = SelectionPopupModel(id: 0, title: "Select Niche");
  }
///this is called when a chip widget is deleted
  handleDelete(SelectionPopupModel platform) {
    selectedValue.value = itemsToDisplay.last;
    update();
    print(selectedValue.value.id);
    selectedDropdownItems.remove(platform);
    itemsToDisplay.value = dropdownItems.value
        .where((item) => !selectedDropdownItems.contains(item))
        .toList();
    selectedValue.value = SelectionPopupModel(id: 0, title: "Select Niche");
    print(selectedValue.value.id);
    update();
  }

  ///this is the function called to create the creator profile on the backend
  Future<void> completeProfile() async {
    completeProfileCreatorModelObj.update((val) {
      val?.bio = bio.text;
      val?.niches =
          selectedDropdownItems.value.map((item) => item.title).toList();
    });

    Get.dialog(
      Center(child: CircularProgressIndicator()), // showing a loading dialog
      barrierDismissible: false, // user must not close it manually
    );
    var token = await storage.read(key: "token");

    try {
      Response loginResponse = await apiClient.creatorProfile(
          completeProfileCreatorModelObj.value, token);
      var headers = loginResponse.headers;
      Get.back();

      if (loginResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');
        await storage.write(key: 'activeProfile', value: "Creator");
        Get.toNamed(
          AppRoutes.homeCreatorContainerScreen,
        );
      } else {
        print(loginResponse.statusCode);
        Get.snackbar(
            'Failure', 'Profile activation failed! ${loginResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Profile activation failed');
    }
  }

  @override
  void onInit() {
    print('OnInit called');
    super.onInit();
    itemsToDisplay.value = dropdownItems.value
        .where((item) => !selectedDropdownItems.contains(item))
        .toList();
    selectedValue.value = SelectionPopupModel(id: 0, title: "Select Niche");
    print(itemsToDisplay.value);
  }

  @override
  void onClose() {
    super.onClose();
    bio.dispose();
    frametwelveoneController.dispose();
    frametwelvetwoController.dispose();
    frametwelveController1.dispose();
  }
}
