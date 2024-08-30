import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/data/models/review/review_model.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:iynfluencer/data/models/Jobs/job_model.dart';

class InfluencerJobTabController extends GetxController {
  Rx<Job?> influencerJobTabModelObj = Rx<Job?>(null);
  var selectedMediaFiles = <MediaFile>[].obs;
  final UserController user = Get.find();
  var storage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  var proof = <String>[].obs;
  final apiClient = ApiClient();
   final notificationClient = NotificationClient();
  final NotificationService notificationService = Get.find();

  void removeSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.remove(mediaFile);
    update();
  }

  void addSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.add(mediaFile);
  }

  void UpdateMediaList(MediaFile mediafile) {
    selectedMediaFiles.insert(0, mediafile);
    update();
  }

  // for pickedImage
  Future<void> handleImageSelection() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final String filePath = pickedFile.path;
      final String name = path.basename(filePath);
      final String type = path.extension(filePath).toLowerCase();
      final File file = File(filePath);

      print("File path: $filePath");
      print("Name: $name");
      print("Type: $type");

      if (type == ".png" || type == ".jpeg" || type == ".jpg") {
        selectedMediaFiles.add(MediaFile(name: name, type: type, file: file));
      } else {
        print("Selected file type is not allowed");
        Get.snackbar("File Error", "Selected file type is not allowed");
      }
    } else {
      // Handle the case where the user canceled the image selection
      print("User canceled image selection");
    }
  }

  // for pickedVideo
  Future<void> handleVideoSelection() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'mp4',
        'avi',
        'mkv'
      ], // Add allowed video file extensions
    );

    if (result != null) {
      final PlatformFile videoFile = result.files.first;
      final String name = videoFile.name ?? "Video";
      final String? extension = videoFile.extension;
      final String type = extension?.toLowerCase() ?? "";
      final File? file = videoFile.path != null ? File(videoFile.path!) : null;

      if (type == "mp4" || type == "avi" || type == "mkv") {
        selectedMediaFiles.add(MediaFile(name: name, type: type, file: file!));
      } else {
        print("Selected video file type is not allowed");
        Get.snackbar("File Error", "Selected video file type is not allowed");
      }
    } else {
      // Handle the case where the user canceled the video selection
      print("User canceled video selection");
    }
  }

// for  pickedDoc
  Future<void> handleDocumentSelection() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc'
            'docx',
      ], // Add allowed document file extensions
    );

    if (result != null) {
      final PlatformFile docFile = result.files.first;
      final String name = docFile.name ?? "Document";
      final String? extension = docFile.extension;
      final String type = extension?.toLowerCase() ?? "";
      final File? file = docFile.path != null ? File(docFile.path!) : null;

      if (type == "pdf" || type == "doc" || type == "docx") {
        selectedMediaFiles.add(MediaFile(name: name, type: type, file: file!));
      } else {
        print("Selected document file type is not allowed");
        Get.snackbar(
            "File Error", "Selected document file type is not allowed");
      }
    } else {
      // Handle the case where the user canceled the document selection
      print("User canceled document selection");
    }
  }

// for pickedMp3
  Future<void> handleMP3Selection() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      final PlatformFile mp3File = result.files.first;
      final String name = mp3File.name ?? "MP3";
      final String? extension = mp3File.extension;
      final String type = extension?.toLowerCase() ?? "";
      final File? file = mp3File.path != null ? File(mp3File.path!) : null;

      if (type == "mp3") {
        selectedMediaFiles.add(MediaFile(name: name, type: type, file: file!));
      } else {
        print("Selected MP3 file type is not allowed");
        Get.snackbar("File Error", "Selected MP3 file type is not allowed");
      }
    } else {
      // Handle the case where the user canceled the MP3 selection
      print("User canceled MP3 selection");
    }
  }

  void submitReview(
    BuildContext context,
    String influencerId,
    String creatorId,
    String jobId,
    String userId,
    String title) async {
  var token = await storage.read(key: 'token');
  isLoading.value = true;

  try {
    List<String> proofUrls = await getProofUrls(
      selectedMediaFiles.map((mediaFile) => mediaFile.file).toList(),
    );

    final reviewPost = ReviewRequest(
      influencerId: influencerId,
      creatorId: creatorId,
      jobId: jobId,
      proof: proofUrls,
    );

    final response = await apiClient.createReview(reviewPost, token);
    if (response.isOk) {
      Get.snackbar('Success', 'Review Submitted Successfully');
      Get.toNamed(AppRoutes.reviewAcceptedScreen,
          parameters: {'jobid': jobId});

      await OneSignal.login(userId);
      if (userId != null) {
        try {
          await notificationClient.sendNotification(
            title,
            'An influencer has submitted a Review',
            userId,
            null,
          );

          await notificationService.createNotification(
            title,
            'An influencer has submitted a Review',
            userId,
            ImageConstant.logo,
          );
        } catch (e) {
          print('Error sending notification: $e');
        }
      }
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body['message'] ?? response.statusText),
        ),
      );
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unauthorized. Please log in.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while submitting the form.'),
        ),
      );
    }
  } catch (e) {
    print('Error during submission: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$e'),
      ),
    );
  } finally {
    isLoading.value = false;
  }
}  


  void editReview(
    BuildContext context,
    String reviewId,
    String influencerId,
    String creatorId,
    String jobId,
    String userId,
    String title) async {
  var token = await storage.read(key: 'token');
  isLoading.value = true;

  try {
    List<String> proofUrls = await getProofUrls(
      selectedMediaFiles.map((mediaFile) => mediaFile.file).toList(),
    );

    final reviewPost = ReviewRequest(
      influencerId: influencerId,
      creatorId: creatorId,
      jobId: jobId,
      proof: proofUrls,
    );

    final response = await apiClient.updateReview(reviewPost, token, reviewId);
    if (response.isOk) {
      Get.snackbar('Success', 'Review Submitted Successfully');
      Get.toNamed(AppRoutes.reviewAcceptedScreen,
          parameters: {'jobid': jobId});

      await OneSignal.login(userId);
      if (userId != null) {
        try {
          await notificationClient.sendNotification(
            title,
            'An influencer has edited a Review',
            userId,
            null,
          );

          await notificationService.createNotification(
            title,
            'An influencer has edited a Review',
            userId,
            ImageConstant.logo,
          );
        } catch (e) {
          print('Error sending notification: $e');
        }
      }
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body['message'] ?? response.statusText),
        ),
      );
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unauthorized. Please log in.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while submitting the form.'),
        ),
      );
    }
  } catch (e) {
    print('Error during submission: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred while submitting the form.'),
      ),
    );
  } finally {
    isLoading.value = false;
  }
}  


Future<String?> uploadPic(String filePath) async {
  try {
    Get.dialog(
      Center(child: CircularProgressIndicator()), 
      barrierDismissible: false, 
    );

    final token = await storage.read(key: "token");

    final response = await apiClient.uploadFile(filePath, token!);

    if (!response.isOk) {
      Get.back();
      Get.snackbar('Error', 'Failed to upload file. Please try again.');
      print('Failed to obtain pre-signed URL');
      return null;
    } 
      
     Get.back();
    print(response.body);
    String presignedUrl = response.body['data']['uploadUrl'];
    print('Pre-Signed URL: $presignedUrl');

      return presignedUrl;
  } catch (e) {
    print(e);
    Get.back();
    Get.snackbar('Error', 'Failed to upload file. Please try again.');
    return null;
  }
}


Future<List<String>> getProofUrls(List<File> files) async {
  List<String> urls = [];
  for (var file in files) {
    try {
      final url = await uploadPic(file.path);
      if (url != null) {
        urls.add(url);
      } else {
        print('Failed to upload file: $file');
        throw Exception('File upload failed'); 
      }
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('File upload failed'); 
    }
  }
  return urls;
}

}
