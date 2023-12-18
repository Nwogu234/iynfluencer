import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/models/complete_profile_influencer_model.dart';
import 'package:iynfluencer/presentation/edit_profile_details_screen/models/edit_profile_details_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileDetailsScreen.
/// This class manages the state of the EditProfileDetailsScreen, including the
/// current editProfileDetailsModelObj
class EditProfileDetailsController extends GetxController {
  TextEditingController frametwelveController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  TextEditingController frametwelvetwoController = TextEditingController();

  TextEditingController frametwelveController1 = TextEditingController();

  Rx<EditProfileDetailsModel> editProfileDetailsModelObj =
      EditProfileDetailsModel().obs;

  final formKey = GlobalKey<FormState>();
  var storage = FlutterSecureStorage();
  final apiClient = ApiClient();
  Rxn<File> profileImage = Rxn<File>();
  Rx<CompleteProfileInfluencerModel> completeProfileInfluencerModelObj =
      CompleteProfileInfluencerModel(bio: "", niches: [], socials: [], user: [])
          .obs;

  Future<void> editProfile() async {
    // Update the bio, niches, and user information influencer
    completeProfileInfluencerModelObj.update((val) {
      val?.bio = frametwelveController1.text;
      val?.niches = frametwelvetwoController.text
          .split(',')
          .map((e) => e.trim())
          .toList();
      if (val?.user?.isNotEmpty == true) {
        final updatedUser = User(
          id: val?.user?[0].id,
          firstName: frametwelveController.text,
          lastName: frametwelveController.text,
          userId: val?.user?[0].userId,
          country: frametwelveoneController.text,
          avatar: val?.user?[0].avatar,
        );
        val?.user?[0] = updatedUser;
      }
    });

    // Get the profile image file if it exists
    final profileImageFile = profileImage.value;
    // print('------- bios--');
    // print(frametwelveController1.text);

    var token = await storage.read(key: "token");
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      Response updateResponse = await apiClient.updateInfluencerProfile(
        completeProfileInfluencerModelObj.value,
        token,
      );

      Get.back();

      if (updateResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');

        // Check if there is a profile image to update
        if (profileImageFile != null) {
          // Upload the profile image
          final uploadResponse = await apiClient.postAvatar(
            profileImageFile.path,
            token!,
          );

          if (uploadResponse.isOk) {
            Get.snackbar('Success', 'Profile Image Updated');
          } else {
            Get.snackbar('Warning', 'Failed to update profile image');
          }
        }

        await storage.write(key: 'activeProfile', value: "Influencer");
        Get.back(result: true); // Navigate back with a result
      } else {
        print(updateResponse.statusCode);
        Get.snackbar('Failure',
            'Profile activation failed! ${updateResponse.body['message']}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Profile activation failed');
    }
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
