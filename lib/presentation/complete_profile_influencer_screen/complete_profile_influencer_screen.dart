import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';
import 'controller/complete_profile_influencer_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CompleteProfileInfluencerScreen
    extends GetWidget<CompleteProfileInfluencerController> {
  CompleteProfileInfluencerScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
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
                      onTapArrowleft1();
                    }),
                actions: [
                  AppbarSubtitle2(
                      text: "lbl_skip".tr,
                      margin:
                          getMargin(left: 28, top: 17, right: 28, bottom: 17))
                ]),
            body: Form(
                key: _formKey,
                child: Padding(
                    padding: getPadding(left: 19, right: 20, bottom: 5),
                    child: ListView(

                        children: [
                          Padding(
                              padding: getPadding(left: 1),
                              child: Text("msg_complete_profile".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH1)),
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
                          Padding(
                              padding: getPadding(top: 25),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(top: 25),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("msg_what_s_your_primary".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSatoshiLight13Gray900),



                                          CustomDropDown(
                                            items: controller.dropdownItems,
                                            margin: getMargin(top: 6),
                                            padding: DropDownPadding.PaddingT14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                          Padding(
                              padding: getPadding(top: 25),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(266),
                                        margin: getMargin(right: 68),
                                        child: Text(
                                            "msg_which_social_media".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight13Gray900)),

                                    CustomButton(
                                        height: getVerticalSize(44),
                                        text: "Add platforms",
                                        onTap: () {
                                          controller.startAddingAccount();
                                        },
                                        margin: getMargin(top: 24),
                                        variant: ButtonVariant.OutlineGray300b2,
                                        padding: ButtonPadding.PaddingT12,
                                        fontStyle: ButtonFontStyle.SatoshiLight14,
                                        prefixWidget: Container(
                                            margin: getMargin(right: 6),
                                            child: CustomImageView(
                                                svgPath:
                                                ImageConstant.imgFrameGray700))),

                                    Obx(() => controller.isAddingAccount.value
                                        ? _buildAccountForm()
                                        : _buildAccountChips()),
                                  ])),

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
                                        controller: controller.bioController,
                                        hintText:
                                        "msg_brief_intro_about".tr,
                                        margin: getMargin(top: 7),
                                        // padding: TextFormFieldPadding.PaddingT47,
                                        textInputAction: TextInputAction.done,
                                        maxLines: 5)
                                  ])),

                        ])
                )
            ),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(50),
                text: "msg_save_and_continue".tr,
                margin: getMargin(left: 19, right: 20, bottom: 38),
                padding: ButtonPadding.PaddingAll15,
                fontStyle: ButtonFontStyle.SatoshiBold14Gray100,
                onTap: () {
                  onTapSaveand();
                })));
  }

  /// Navigates to the influencerHomeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the influencerHomeScreen.
  ///
  Widget _buildAccountForm() {
    // Replace the TextEditingController objects with the actual ones.
    var platformNameController = TextEditingController();
    var followersCountController = TextEditingController();
    var platformUrlController = TextEditingController();

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: CustomDropDown(
              hintText: 'Select a platform',
              onChanged: (value){
                controller.selectedSocialMediaPlatform.value=value.value;
                },
              validator: (value) {
                if (value == null || value.value.isEmpty) {
                  return 'Please enter a platform name';
                }
                return null;
              },
              items: controller.socialMediaPlatforms,
              margin: getMargin(top: 6),
              padding: DropDownPadding.PaddingT14,
            ),
          ),
          // CustomTextFormField(
          //   controller: platformNameController,
          //   hintText: 'Platform name',

          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.all(8.0),
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
          CustomButton(
            text:'Add',
            onTap: () {


              if (controller.formKey.currentState!.validate()) {

                controller.addAccount(
                    controller.selectedSocialMediaPlatform.value,
                    int.parse(followersCountController.text),
                    platformUrlController.text
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountChips() {
    // Make a copy of the list before iterating over it.
    var accountsCopy = controller.socialMediaAccounts.toList();

    return Wrap(
      spacing: 8.0,
      children: accountsCopy.map((account) {
        return Chip(
          label: Text('${account.platformName} - ${account.followersCount} followers'),
          deleteIcon: Icon(
            Icons.close,
          ),
          onDeleted: () => controller.handleDelete(account),
        );
      }).toList(),
    );
  }

  onTapSaveand() {
    Get.toNamed(
      AppRoutes.influencerHomeScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft1() {
    Get.back();
  }
}

