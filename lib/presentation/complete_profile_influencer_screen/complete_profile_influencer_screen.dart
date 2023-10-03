import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

import '../../widgets/custo_dropdown.dart';
import 'controller/complete_profile_influencer_controller.dart';

// ignore_for_file: must_be_immutable

class CompleteProfileInfluencerScreen
    extends GetWidget<CompleteProfileInfluencerController> {
  final _formKey = GlobalKey<FormState>();

  CompleteProfileInfluencerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.whiteA70001,
        appBar: CustomAppBar(
          height: 54.h,
          leadingWidth: 50.w,
          leading: AppbarImage(
              height: getSize(30.h),
              width: getSize(30.w),
              svgPath: ImageConstant.imgArrowleftGray600,
              margin: getMargin(left: 20, top: 12, bottom: 12),
              onTap: () {
                onTapArrowleft1();
              }),
          actions: [
            AppbarSubtitle2(
                text: "lbl_skip".tr,
                margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 17.h))
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: controller.animationController,
                  curve: Curves.easeIn,
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("msg_complete_profile".tr,
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
                                controller.profileImage.value =
                                    File(image.path);
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
                              height: 90.h,
                              width: 95.w,
                              margin:
                              EdgeInsets.only(left: 8.w, top: 31.h),
                            )
                                : CircleAvatar(
                              radius: 45.h,
                              backgroundImage:
                              FileImage(controller.profileImage.value!),
                            ),
                          ),
                        ),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("msg_what_s_your_primary".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight13Gray900),
                                        Obx(
                                              () => FormField<SelectionPopupModel>(
                                            validator: (value) {
                                              if (value?.value == null || value?.value.isEmpty) {
                                                return 'Please select at least one option'; // Your validation logic here
                                              }
                                              return null;
                                            },
                                            initialValue: controller.selectedNiche.value,
                                            builder: (FormFieldState<SelectionPopupModel> state) {
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
                                                        controller.onDropdownItemChanged(newValue);
                                                        state.didChange(newValue); // Trigger validation on change
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

                                        Obx(() => Wrap(
                                          spacing: 8.0.w,
                                          children: controller
                                              .selectedNiches.value
                                              .map((niche) {
                                            return Chip(
                                              label: Text('${niche.title}'),
                                              deleteIcon: Icon(
                                                Icons.close,
                                              ),
                                              onDeleted: () => controller
                                                  .handleNicheDelete(niche),
                                            );
                                          }).toList(),
                                        )),
                                      ],
                                    ),
                                  ),
                                ])),
                        // Social media accounts
                        Padding(
                            padding: getPadding(top: 25),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: getHorizontalSize(266.h),
                                      margin: getMargin(right: 68.w),
                                      child: Text("msg_which_social_media".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                          AppStyle.txtSatoshiLight13Gray900)),
                                  CustomButton(
                                      height: getVerticalSize(44.h),
                                      text: "Add platforms",
                                      onTap: () {
                                        controller.startAddingAccount();
                                      },
                                      margin: getMargin(top: 24.h),
                                      variant: ButtonVariant.OutlineGray300b2,
                                      padding: ButtonPadding.PaddingT12,
                                      fontStyle: ButtonFontStyle.SatoshiLight14,
                                      prefixWidget: Container(
                                          margin: getMargin(right: 6.w),
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgFrameGray700))),
                                  Obx(() => controller.isAddingAccount.value
                                      ? _buildAccountForm()
                                      : _buildAccountChips()),

                                  if (controller.errorText.value != null)
                                    Obx(() => Text(
                                      controller.errorText.value,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10.sp,
                                      ),),
                                    )
                                ])),
                        // Bio
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
                            controller: controller.bioController,
                            hintText: "msg_brief_intro_about".tr,
                            margin: EdgeInsets.only(top: 7.h),
                            maxLines: 5),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomButton(
          height: 50.h,
          text: "msg_save_and_continue".tr,
          margin: EdgeInsets.only(left: 19.w, right: 20.w, bottom: 38.h),
          padding: ButtonPadding.PaddingAll15,
          fontStyle: ButtonFontStyle.SatoshiBold14Gray100,
          onTap: onTapSaveand,
        ),
      ),
    );
  }

void onTapArrowleft1() {
    Get.back();
  }

  void onTapSaveand()async {

    if (controller.socialMediaAccounts.value.isEmpty) {
      controller.errorText.value = "Please select at least one platform";
      // Return early if validation fails
    }
    if (_formKey.currentState!.validate()) {
      await controller.completeProfile();
    }
  }

  Widget _buildAccountChips() {
    var accountsCopy = controller.socialMediaAccounts.toList();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller.animationController, curve: Curves.easeOut),
      ),
      child: Wrap(
        spacing: 8.0.w,
        children: accountsCopy.map((account) {
          return Chip(
            label: Text('${account.platformName.title} - ${account.followersCount} followers'),
            deleteIcon: Icon(Icons.close),
            onDeleted: () => controller.handleDelete(account, account.platformName),
          );
        }).toList(),
      ),
    );
  }

  // Rest of the methods...
  Widget _buildAccountForm() {
    var platformNameController = TextEditingController();
    var followersCountController = TextEditingController();
    var platformUrlController = TextEditingController();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller.animationController, curve: Curves.easeIn),
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Obx(
                  () => FormField<SelectionPopupModel>(
                validator: (value) {
                  if (value?.value == null || value?.value.isEmpty) {
                    return 'Please select a platform name';
                  }
                },
                initialValue: controller.selectedSocialMedia.value,
                builder: (FormFieldState<SelectionPopupModel> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustoDropDown(
                        value: controller.selectedSocialMedia.value,
                        hintText: 'Select a platform',
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedSocialMedia.value = newValue;
                            state.didChange(newValue);
                          }
                        },
                        items: controller.platformToDisplay,
                        margin: EdgeInsets.only(top: 6.h),
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText!,
                          style: TextStyle(color: Colors.red, fontSize: 10.sp),
                        ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CustomTextFormField(
                autofocus: true,
                controller: followersCountController,
                hintText: 'Followers count',
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Please enter a valid number of followers';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CustomTextFormField(
                autofocus: true,
                controller: platformUrlController,
                hintText: 'Platform URL',
                validator: (value) {
                  if (value == null || value.isEmpty || !Uri.parse(value).isAbsolute) {
                    return 'Please enter a valid URL';
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
                        controller.isAddingAccount.value = false;
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
                          controller.addAccount(
                              controller.selectedSocialMedia.value,
                              int.parse(followersCountController.text),
                              platformUrlController.text);
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
}

