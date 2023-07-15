import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/edit_profile_details_screen/models/edit_profile_details_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditProfileDetailsScreen.
///
/// This class manages the state of the EditProfileDetailsScreen, including the
/// current editProfileDetailsModelObj
class EditProfileDetailsController extends GetxController {TextEditingController frametwelveController = TextEditingController();

TextEditingController frametwelveoneController = TextEditingController();

TextEditingController frametwelvetwoController = TextEditingController();

TextEditingController frametwelveController1 = TextEditingController();

Rx<EditProfileDetailsModel> editProfileDetailsModelObj = EditProfileDetailsModel().obs;

@override void onClose() { super.onClose(); frametwelveController.dispose(); frametwelveoneController.dispose(); frametwelvetwoController.dispose(); frametwelveController1.dispose(); } 
 }
