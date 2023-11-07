import 'dart:io';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/data/models/use_model/user_model.dart';
import 'package:iynfluencer/presentation/edit_profile_listed_jobs_tab_container_screen/edit_profile_listed_jobs_tab_container_screen.dart';

import 'controller/edit_profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class EditProfileDetailsScreen extends GetWidget<EditProfileDetailsController> {
  EditProfileDetailsScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            appBar: CustomAppBar(
                height: getVerticalSize(54),
                leadingWidth: 50,
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 20, top: 12, bottom: 12),
                    onTap: () {
                      onTapArrowleft8();
                    }),
                actions: [
                  AppbarSubtitle2(
                      text: "lbl_skip".tr,
                      margin:
                          getMargin(left: 28, top: 17, right: 28, bottom: 17))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Text("msg_edit_profile".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtH1),
                      GestureDetector(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          try {
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              controller.profileImage.value = File(image.path);
                            }
                          } catch (e) {
                            Get.snackbar('Error',
                                'Failed to pick an image. Please try again.');
                          }
                        },
                        child: Obx(
                          () => controller.profileImage.value == null
                              ? CustomImageView(
                                  svgPath: ImageConstant.imgCheckmark,
                                  height: getVerticalSize(90),
                                  width: getHorizontalSize(95),
                                  margin: getMargin(left: 8, top: 31))
                              : CircleAvatar(
                                  radius: 45.h,
                                  backgroundImage:
                                      FileImage(controller.profileImage.value!),
                                ),
                        ),
                      ),
                      Padding(
                          padding: getPadding(top: 36),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_full_name".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your name";
                                      }
                                      return null;
                                    },
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frametwelveController,
                                    hintText: "lbl_john_doe".tr,
                                    margin: getMargin(top: 7))
                              ])),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_country".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your country";
                                      }
                                      return null;
                                    },
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frametwelveoneController,
                                    hintText: "lbl_eg_nigeria".tr,
                                    margin: getMargin(top: 6))
                              ])),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("msg_what_s_your_primary".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your niche";
                                      }
                                      return null;
                                    },
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frametwelvetwoController,
                                    hintText: "msg_eg_videography".tr,
                                    margin: getMargin(top: 6),
                                    padding: TextFormFieldPadding.PaddingT14,
                                    suffix: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 14,
                                            right: 13,
                                            bottom: 14),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray600)),
                                    suffixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(48)))
                              ])),
                      Padding(
                          padding: getPadding(top: 22, bottom: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_bio".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter valid text";
                                      }
                                      return null;
                                    },
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frametwelveController1,
                                    hintText: "msg_brief_intro_about".tr,
                                    margin: getMargin(top: 7),
                                    padding: TextFormFieldPadding.PaddingT47,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 5)
                              ]))
                    ]))),
            bottomNavigationBar: CustomButton(
              height: getVerticalSize(50),
              text: "msg_save_and_continue".tr,
              margin: getMargin(left: 20, right: 20, bottom: 17),
              padding: ButtonPadding.PaddingAll15,
              fontStyle: ButtonFontStyle.SatoshiBold14Gray100,
              onTap: onTapSaveEdit,
            )));
  }

  void onTapSaveEdit() async {
    if (_formKey.currentState!.validate()) {
      final bytes = await controller.profileImage.value!.readAsBytes();
      final base64Image = base64Encode(bytes);

      final args = EditProfileArguments(
          controller.frametwelveController.text,
          controller.frametwelveController.text,
          controller.frametwelveoneController.text,
          controller.frametwelveController1.text,
          base64Image);

      await controller.editProfile();

      Get.off(
        EditProfileListedJobsTabContainerScreen(),
        arguments: args,
      );
    }
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft8() {
    Get.back();
  }
}
