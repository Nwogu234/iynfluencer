import 'dart:convert';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/presentation/post_page_screen/models/post_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PostPageScreen.
///
/// This class manages the state of the PostPageScreen, including the
/// current postPageModelObj
class PostPageController extends GetxController
    with SingleGetTickerProviderMixin {
  PostPageController(this.postPageModelObj);
  TextEditingController inputController = TextEditingController();

  TextEditingController frametwelveController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController priceoneController = TextEditingController();

  TextEditingController frametwelveoneController = TextEditingController();

  TextEditingController durationController = TextEditingController();

  TextEditingController frametwelvetwoController = TextEditingController();
  late AnimationController animationController;

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
  var resposibilities = <String>[].obs;
  startAddingResponsibilities() {
    isAddingResponsibility.value = true;
  }

  addResponsibilities(String responsibility) {
    resposibilities.add(responsibility);
    print(responsibility);
    isAddingResponsibility.value = false;
  }

  Rx<PostPageModel> postPageModelObj = PostPageModel().obs;

  handleDelete(String account) {
    resposibilities.remove(account);
    update();
  }

// this is for posting jobs
  var token;
  var error = ''.obs;

  Future<void> postJob() async {
    final apiClient = ApiClient();
    // Collect user input from the form fields.
    final String title = inputController.text;
    final String description = frametwelveoneController.text;
    final int budgetFrom = int.tryParse(priceController.text) ?? 0;
    final int budgetTo = int.tryParse(priceoneController.text) ?? 0;
    final int duration = int.tryParse(durationController.text) ?? 0;

    // Create a new job instance with the collected data.
    final newJob = Job(
      title: title,
      description: description,
      budgetFrom: budgetFrom,
      budgetTo: budgetTo,
      id: 'placeholder_id',
      creatorId: 'placeholder_creator_id',
      duration: duration,
      public: true,
      hired: false,
      suspended: false,
      jobId: 'placeholder_job_id',
      createdAt: '2023-08-17T00:00:00.000Z',
      updatedAt: '2023-08-17T00:00:00.000Z',
      version: 1,
      creator: [],
      bidsCount: 0,
      responsibilities: resposibilities.toList(),
      category: [selectedNiche.value.value],
    );

    try {
      final response = await apiClient.createJob(newJob, token);

      if (response.isOk) {
        Get.snackbar('Success', 'Job posted successfully');
      } else {
        Get.snackbar('Error', 'Job posting failed');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'An error occurred while posting the job');
    }
  }

  // for media selection
  var selectedMediaFiles = <MediaFile>[].obs;
  // Add a method to add a selected media file
  void addSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.add(mediaFile);
  }

  // Method to remove a selected media file
  void removeSelectedMediaFile(MediaFile mediaFile) {
    selectedMediaFiles.remove(mediaFile);
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

  void submitForm(BuildContext context) async {
    // Validate the media files
    if (!validateMediaFiles(selectedMediaFiles)) {
      // Media file validation failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Media files are invalid or exceed 25 MB total.'),
        ),
      );
      return;
    }
    if (formKey.currentState!.validate()) {
      final JobRequest jobRequest = JobRequest(
        title: inputController.text,
        description: frametwelveoneController.text,
        budgetFrom: int.tryParse(priceController.text) ?? 0,
        budgetTo: int.tryParse(priceoneController.text) ?? 0,
        duration: int.tryParse(durationController.text) ?? 0,
        category: selectedNiche.value.value,
        responsibilities: resposibilities.toList(),
      );

      // Adapt the form data to the Job model structure
      final Job adaptedJob = Job(
        title: jobRequest.title,
        description: jobRequest.description,
        budgetFrom: jobRequest.budgetFrom,
        budgetTo: jobRequest.budgetTo,
        duration: jobRequest.duration,
        category: jobRequest.category,
        responsibilities: jobRequest.responsibilities,
        id: 'placeholder_id',
        creatorId: 'placeholder_creator_id',
        public: true,
        hired: false,
        suspended: false,
        jobId: 'placeholder_job_id',
        createdAt: '2023-08-17T00:00:00.000Z',
        updatedAt: '2023-08-17T00:00:00.000Z',
        version: 1,
        creator: [],
        bidsCount: 0,
      );

      final apiClient = ApiClient();

      // Sending it to a server using an API request
      try {
        final response = await apiClient.createJob(adaptedJob, token);

        if (response.isOk) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Form submitted successfully.'),
            ),
          );
          // Job posting was successful.
          final Map<String, dynamic> responseData =
              json.decode(response.toString());
          final jobPosted = Job.fromJson(responseData);
          // Navigate to CreatorJobslistPage with the newly created job data
          Get.offNamed(
            '/creator-jobslist',
            arguments: {'adaptedJob': jobPosted},
          );
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
      } catch (error) {
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
