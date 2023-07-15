import 'dart:io';

import 'controller/complete_profile_creator_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';
import 'package:image_picker/image_picker.dart';


class CompleteProfileCreatorScreen
    extends GetWidget<CompleteProfileCreatorController> {
  const CompleteProfileCreatorScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft();
                    }),
                actions: [
                  AppbarSubtitle2(
                      text: "lbl_skip".tr,
                      margin:
                      getMargin(left: 28, top: 17, right: 28, bottom: 17))
                ]),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: getPadding(left: 20, right: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("msg_complete_profile".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtH1),
                            Padding(
                              padding: getPadding(top: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  try {
                                    // Pick an image
                                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      controller.profileImage.value = File(image.path);
                                    }
                                  } catch (e) {
                                    print(e);
                                    // You can display an error message to the user
                                    Get.snackbar('Error', 'Failed to pick an image. Please try again.');
                                  }
                                },
                                child: Obx(
                                      () => controller.profileImage.value == null
                                      ? CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                    height: getVerticalSize(90),
                                    width: getHorizontalSize(95),
                                    margin: getMargin(left: 8, top: 31),
                                  )
                                      : CircleAvatar(
                                    radius: getVerticalSize(45),
                                    backgroundImage: FileImage(controller.profileImage.value!),
                                  ),
                                ),
                              ),
                            ),



                            // other widgets are omitted for simplicity
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
                                    CustomDropDown(
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      items: controller.dropdownItems,
                                      onChanged: (value) {
                                        // Handle value change
                                      },
                                    ),
                                  ]),
                            ),
                           // other widgets are omitted for simplicity
                            Padding(
                                padding: getPadding(top: 22),
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_bio".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight13Gray900),
                                      CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller: controller
                                              .frametwelveController1,
                                          hintText:
                                          "msg_brief_intro_about".tr,
                                          margin: getMargin(top: 7),
                                          padding:
                                          TextFormFieldPadding.PaddingT47,
                                          textInputAction:
                                          TextInputAction.done,
                                          maxLines: 5)
                                    ])),
                            CustomButton(
                                height: getVerticalSize(50),
                                text: "msg_save_and_continue".tr,
                                margin: getMargin(top: 22),
                                padding: ButtonPadding.PaddingAll15,
                                fontStyle:
                                ButtonFontStyle.SatoshiBold14Gray100,
                                onTap: onTapSaveand)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }

  onTapSaveand() {
    Get.toNamed(
      AppRoutes.homeCreatorContainerScreen,
       // added fade transition
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
