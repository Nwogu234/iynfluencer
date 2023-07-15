import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/presentation/edit_profile_details_one_screen/models/edit_profile_details_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditProfileDetailsOneScreen.
///
/// This class manages the state of the EditProfileDetailsOneScreen, including the
/// current editProfileDetailsOneModelObj
class EditProfileDetailsOneController extends GetxController {TextEditingController frametwelveController = TextEditingController();

TextEditingController frametwelveoneController = TextEditingController();

TextEditingController frametwelvetwoController = TextEditingController();

TextEditingController frametwelveController1 = TextEditingController();

TextEditingController usernameController = TextEditingController();

TextEditingController frametwelveController2 = TextEditingController();

Rx<EditProfileDetailsOneModel> editProfileDetailsOneModelObj = EditProfileDetailsOneModel().obs;

@override void onClose() { super.onClose(); frametwelveController.dispose(); frametwelveoneController.dispose(); frametwelvetwoController.dispose(); frametwelveController1.dispose(); usernameController.dispose(); frametwelveController2.dispose(); } 
 }
