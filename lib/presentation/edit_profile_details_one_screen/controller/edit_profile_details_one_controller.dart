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

  Future<void> editProfileTwo() async {
    // Update the bio and niches in the CompleteProfileCreatorModel
    completeProfileCreatorModelObj.update((val) {
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
      val?.socials = [];
    });

    final profileImageFile = profileImage.value;

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    var token = await storage.read(key: "token");

    try {
      Response updateResponse = await apiClient.updateCreatorProfile(
        completeProfileCreatorModelObj.value,
        token,
      );

      if (updateResponse.statusCode == 201) {
        Get.snackbar('Success', 'Profile Updated');
        // Check if there is a profile image to update
        if (profileImageFile != null) {
          // Upload the profile image
          final uploadResponse = await apiClient.postAvatar(
            profileImageFile.path,
            token!,
          );
          /*  final uploadResponse = await http.put(
            Uri.parse(presignedUrl),
            headers: {
              'Content-Type':
                  'image/jpeg', // This should match what you set in the backend
            },
            body: fileBytes,
          ); */

          if (uploadResponse.isOk) {
            Get.snackbar('Success', 'Profile Image Updated');
          } else {
            Get.snackbar('Warning', 'Failed to update profile image');
          }
        }

        await storage.write(key: 'activeProfile', value: "Creator");
        Get.back(result: true);
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
    usernameController.dispose();
    frametwelveController2.dispose();
  }
}
