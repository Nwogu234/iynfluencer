import 'dart:io';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/complete_profile_creator_screen/models/complete_profile_creator_model.dart';
import 'package:iynfluencer/presentation/edit_profile_details_one_screen/models/edit_profile_details_one_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';

/// A controller class for the EditProfileDetailsOneScreen.
///
/// This class manages the state of the EditProfileDetailsOneScreen, including the
/// current editProfileDetailsOneModelObj
class EditProfileDetailsOneController extends GetxController {
  TextEditingController frametwelveController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  TextEditingController frametwelvetwoController = TextEditingController();

  TextEditingController frametwelveController1 = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController frametwelveController2 = TextEditingController();

  Rx<EditProfileDetailsOneModel> editProfileDetailsOneModelObj =
      EditProfileDetailsOneModel().obs;
  Rxn<File> profileImage = Rxn<File>();

  final formKey = GlobalKey<FormState>();
  var storage = FlutterSecureStorage();
  final apiClient = ApiClient();
  Rx<CompleteProfileCreatorModel> completeProfileCreatorModelObj =
      CompleteProfileCreatorModel(bio: "", niches: [], socials: [], user: [])
          .obs;

  @override
  void onClose() {
    super.onClose();
    frametwelveController.dispose();
    frametwelveoneController.dispose();
    frametwelvetwoController.dispose();
    frametwelveController1.dispose();
    usernameController.dispose();
    frametwelveController2.dispose();
  }
}
