import 'dart:io';

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
 TextEditingController frametwelveController = TextEditingController();
 TextEditingController frametwelveoneController = TextEditingController();
 TextEditingController frametwelvetwoController = TextEditingController();
 TextEditingController frametwelveController1 = TextEditingController();

 Rx<CompleteProfileCreatorModel> completeProfileCreatorModelObj = CompleteProfileCreatorModel().obs;
 Rxn<File> profileImage = Rxn<File>(); // Add this

 final List<SelectionPopupModel> dropdownItems = [
  SelectionPopupModel(id: 1, title: "Fashion & Style", value: "Fashion & Style"),
  SelectionPopupModel(id: 2, title: "Beauty", value: "Beauty"),
  SelectionPopupModel(id: 3, title: "Health & Fitness", value: "Health & Fitness"),
  SelectionPopupModel(id: 4, title: "Travel", value: "Travel"),
  SelectionPopupModel(id: 5, title: "Food & Cooking", value: "Food & Cooking"),
  SelectionPopupModel(id: 6, title: "Parenting & Family", value: "Parenting & Family"),
  SelectionPopupModel(id: 7, title: "Tech & Gaming", value: "Tech & Gaming"),
  SelectionPopupModel(id: 8, title: "Home & Interior Design", value: "Home & Interior Design"),
  SelectionPopupModel(id: 9, title: "Finance & Investment", value: "Finance & Investment"),
  SelectionPopupModel(id: 10, title: "Entertainment & Celebrity", value: "Entertainment & Celebrity"),
  SelectionPopupModel(id: 11, title: "Art & DIY Craft", value: "Art & DIY Craft"),
  SelectionPopupModel(id: 12, title: "Sustainability & Eco-friendly", value: "Sustainability & Eco-friendly"),
  SelectionPopupModel(id: 13, title: "Education & Career", value: "Education & Career"),
  SelectionPopupModel(id: 14, title: "Science & Technology", value: "Science & Technology"),
  SelectionPopupModel(id: 15, title: "Others", value: "Others"),
 ];

 Rx<SelectionPopupModel> selectedDropdownItem = SelectionPopupModel(id: 1, title: "Fashion & Style", value: "Fashion & Style").obs;

 void onDropdownItemChanged(SelectionPopupModel value) {
  selectedDropdownItem.value = value;
 }

 @override
 void onClose() {
  super.onClose();
  frametwelveController.dispose();
  frametwelveoneController.dispose();
  frametwelvetwoController.dispose();
  frametwelveController1.dispose();
 }
}
