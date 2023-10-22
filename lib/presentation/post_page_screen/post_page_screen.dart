import 'package:flutter/services.dart';
import 'package:iynfluencer/widgets/media_file.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/presentation/complete_profile_influencer_screen/controller/complete_profile_influencer_controller.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/home_creator_container_screen.dart';

import '../../widgets/custo_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'controller/post_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_button.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'models/post_page_model.dart';

// ignore_for_file: must_be_immutable
class PostPageScreen extends GetWidget {
  PostPageScreen(
      {Key? key, this.fromHire = false, this.fromHireInfluencerId = ''})
      : super(
          key: key,
        ); //
  PostPageController controller =
      Get.put(PostPageController(PostPageModel().obs));
  bool fromHire;
  String fromHireInfluencerId;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MediaFile> selectedMediaFiles = [];
  void removeSelectedMediaFile(String filePath) {
    selectedMediaFiles.remove(filePath);
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

      if (type == "png" || type == "jpeg" || type == "jpg") {
        controller.selectedMediaFiles
            .add(MediaFile(name: name, type: type, file: file));
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
        controller.selectedMediaFiles
            .add(MediaFile(name: name, type: type, file: file!));
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

      if (type == "pdf" || type == "doc") {
        controller.selectedMediaFiles
            .add(MediaFile(name: name, type: type, file: file!));
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
        controller.selectedMediaFiles
            .add(MediaFile(name: name, type: type, file: file!));
      } else {
        print("Selected MP3 file type is not allowed");
        Get.snackbar("File Error", "Selected MP3 file type is not allowed");
      }
    } else {
      // Handle the case where the user canceled the MP3 selection
      print("User canceled MP3 selection");
    }
  }

  void showMediaSelectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Media"),
          children: [
            _buildMediaItemTile(
              context,
              Icons.photo,
              "Select Image",
              handleImageSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.video_library,
              "Select Video",
              handleVideoSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.insert_drive_file,
              "Select Document",
              handleDocumentSelection,
            ),
            _buildMediaItemTile(
              context,
              Icons.music_note,
              "Select Mp3",
              handleMP3Selection,
            ),
          ],
        );
      },
    );
  }

  ListTile _buildMediaItemTile(
      BuildContext context, IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () async {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            57,
          ),
          leadingWidth: 44,
          leading: AppbarImage(
            onTap: () {
              print("AppbarImage onTap triggered");
              controller.homcont.currentRoute.value=AppRoutes.homeCreatorPage;
              Navigator.of(Get.nestedKey(1)!.currentState!.context).pushReplacementNamed(AppRoutes.homeCreatorPage);
              controller.bumcont.selectedIndex.value = 0;
            },
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgArrowright,
            margin: getMargin(
              left: 20,
              top: 17,
              bottom: 16,
            ),
          ),
          actions: [
            AppbarButton(
              margin: getMargin(
                left: 21,
                top: 13,
                right: 21,
                bottom: 12,
              ),
              onTap: () {
                controller.submitForm(context, fromHire, fromHireInfluencerId);
              },
            ),
          ],
          styleType: Style.bgShadowGray9000c,
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: getPadding(
              top: 35,
            ),
            child: Form(
              key: controller.formKeyMain,
              child: Padding(
                padding: getPadding(
                  left: 20,
                  right: 19,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      width: getHorizontalSize(
                        216,
                      ),
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: controller.inputController,
                      hintText: "msg_what_is_the_job".tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a job title';
                        }
                        return null; // Return null if the input is valid
                      },
                      margin: getMargin(
                        left: 1,
                      ),
                      variant: TextFormFieldVariant.None,
                      fontStyle: TextFormFieldFontStyle.SatoshiBold22,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Container(
                        margin: getMargin(
                          top: 23,
                        ),
                        padding: getPadding(
                          left: 28,
                          top: 33,
                          right: 28,
                          bottom: 33,
                        ),
                        decoration: AppDecoration.outlineGray20002.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder7,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: getHorizontalSize(
                                236,
                              ),
                              margin: getMargin(
                                left: 22,
                                top: 1,
                                right: 20,
                              ),
                              child: Text(
                                "msg_upload_media_files".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtSatoshiLight13,
                              ),
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                43,
                              ),
                              text: "lbl_select_media".tr,
                              onTap: () {
                                showMediaSelectionModal(context);
                              },
                              margin: getMargin(
                                top: 13,
                              ),
                              variant: ButtonVariant.OutlineGray300b2,
                              padding: ButtonPadding.PaddingAll12,
                              fontStyle: ButtonFontStyle.SatoshiLight14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selected Media Files:",
                            style: AppStyle.txtSatoshiLight13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                controller.selectedMediaFiles.map((mediaFile) {
                              return ListTile(
                                title: Text(mediaFile.name),
                                subtitle: Text(mediaFile.type),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    controller
                                        .removeSelectedMediaFile(mediaFile);
                                  },
                                ),
                                onTap: () {
                                  // Show a dialog to display the media
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Media Preview'),
                                        content: MediaFileWidget(
                                            mediaFile: mediaFile),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_job_category".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight13Gray900,
                          ),
                          Obx(
                            () => FormField<SelectionPopupModel>(
                              validator: (value) {
                                if (value?.value == null ||
                                    value?.value.isEmpty) {
                                  return 'Please select at least one option'; // Your validation logic here
                                }
                                return null;
                              },
                              initialValue: controller.selectedNiche.value,
                              builder:
                                  (FormFieldState<SelectionPopupModel> state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustoDropDown(
                                      value: controller.selectedNiche.value,
                                      hintText: 'Add Niche',
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      items: controller.nicheToDisplay,
                                      onChanged: (newValue) {
                                        if (newValue != null) {
                                          controller
                                              .onDropdownItemChanged(newValue);
                                          state.didChange(
                                              newValue); // Trigger validation on change
                                        }
                                      },
                                    ),
                                    if (state.hasError)
                                      Text(
                                        state.errorText!,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Obx(
                            () => Wrap(
                              spacing: 8.0,
                              children: controller.selectedNiches.map(
                                (niche) {
                                  return Chip(
                                    label: Text('${niche.title}'),
                                    deleteIcon: Icon(
                                      Icons.close,
                                    ),
                                    onDeleted: () =>
                                        controller.handleNicheDelete(niche),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 29,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "msg_what_is_your_budget".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight13Gray900,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(
                                      right: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_from".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtSatoshiLight13Gray900,
                                        ),
                                        CustomTextFormField(
                                          validator: (value) {
                                            double? thisValue = double.tryParse(value ?? "");
                                            double? otherValue = double.tryParse(controller.priceoneController.text);

                                            if (thisValue == null) {
                                              return 'Please enter a valid number';
                                            } else if (otherValue != null && thisValue >= otherValue) {
                                              return 'Value should be less than the other field';
                                            }

                                            return null;
                                          },
                                          width: getHorizontalSize(
                                            160,
                                          ),
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller:
                                              controller.priceController,
                                          hintText: "lbl_50".tr,
                                          margin: getMargin(
                                            top: 7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(
                                      left: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_to".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtSatoshiLight13Gray900,
                                        ),
                                        CustomTextFormField(
                                          width: getHorizontalSize(
                                            160,
                                          ),
                                          validator: (value) {
                                            double? thisValue = double.tryParse(value ?? "");
                                            double? otherValue = double.tryParse(controller.priceController.text);

                                            if (thisValue == null) {
                                              return 'Please enter a valid number';
                                            } else if (otherValue != null && thisValue <= otherValue) {
                                              return 'Value should be greater than the other field';
                                            }

                                            return null;
                                          },
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller:
                                              controller.priceoneController,
                                          hintText: "lbl_2002".tr,
                                          margin: getMargin(
                                            top: 7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: getPadding(
                          top: 29,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Job Duration", // Add a localization key if needed
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight13Gray900,
                              ),
                              CustomTextFormField(
                                width: getHorizontalSize(160),
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.durationController,
                                hintText: "Enter duration in days",
                                margin: getMargin(top: 7),
                                /*  decoration: InputDecoration(
                                errorStyle: TextStyle( 
                                color: Colors.red
                               )), */
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a duration';
                                  }
                                  return null; // Return null if the input is valid
                                },
                              ),
                            ])),
                    Padding(
                      padding: getPadding(
                        top: 29,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_add_description".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight13Gray900,
                          ),
                          CustomTextFormField(
                            maxLines: 4,
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: controller.frametwelveoneController,
                            hintText: "msg_explain_briefly".tr,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a duration';
                              }
                              return null; // Return null if the input is valid
                            },
                            margin: getMargin(
                              top: 6,
                            ),
                            // padding: TextFormFieldPadding.PaddingT38,
                          ),
                        ],
                      ),
                    ),

    Padding(
        padding: getPadding(
          top: 29,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "msg_add_responsibilities".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSatoshiLight13Gray900,
            ),
            CustomButton(
              height: getVerticalSize(44.h),
              text: "Add the tasks to be carried out",
              onTap: () {
                controller.startAddingResponsibilities();
              },
              margin: getMargin(top: 24.h),
              variant: ButtonVariant.OutlineGray300b2,
              padding: ButtonPadding.PaddingT12,
              fontStyle: ButtonFontStyle.SatoshiLight14,
              prefixWidget: Container(
                margin: getMargin(right: 6.w),
                child: CustomImageView(
                    svgPath: ImageConstant.imgFrameGray700),
              ),
            ),
            Obx(() => controller.isAddingResponsibility.value
                ? _buildAccountForm()
                : _buildAccountChips()),
            if (controller.errorText.value.isNotEmpty)
              Obx(
                    () => Text(
                  controller.errorText.value,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.sp,
                  ),
                ),
              )
          ],
        ),
      ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //addn responsibilites widget
  Widget _buildAccountForm() {
    var responsibilityController = TextEditingController();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.animationController, curve: Curves.easeIn),
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                maxLines: 4,
                controller: responsibilityController,
                hintText: "msg_input_all_milestones".tr,
                margin: getMargin(
                  top: 6,
                ),
                // padding: TextFormFieldPadding.PaddingT38,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: CustomButton(
                      text: 'Cancel',
                      onTap: () {
                        controller.isAddingResponsibility.value = false;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: CustomButton(
                      text: 'Add',
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.errorText.value = "";
                          controller.addResponsibilities(
                              responsibilityController.text);
                          // controller.animationController.reverse();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //This is for showing the list of responsibilities
  Widget _buildAccountChips() {
    List responsibilitiesCopy = controller.responsibilities.toList();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.animationController, curve: Curves.easeOut),
      ),
      child: Wrap(
        spacing: 8.0.w,
        children: responsibilitiesCopy.map((account) {
          return Chip(
            label: Text("${account.toString()}"),
            deleteIcon: Icon(Icons.close),
            onDeleted: () => controller.handleDelete(account),
          );
        }).toList(),
      ),
    );
  }
}

onTapArrowleft12() {
  print("object");
  Get.back();
}
