import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_checkbox.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

import 'models/sign_up_model.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA70001,
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 20, top: 12, right: 20, bottom: 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowleftGray600,
                                height: getSize(30),
                                width: getSize(30),
                                onTap: () {
                                  onTapImgArrowleft();
                                }),
                            Padding(
                                padding: getPadding(left: 5, top: 19),
                                child: Text("msg_create_an_account".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH1)),
                            Container(
                                width: getHorizontalSize(262),
                                margin: getMargin(left: 6, top: 7, right: 66),
                                child: Text("msg_enter_your_details".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray600)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.firstnameController,
                                hintText: "lbl_first_name".tr,
                                margin: getMargin(top: 34),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null ||!isText(value, isRequired: true)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.lastnameController,
                                hintText: "lbl_last_name".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null || !isText(value, isRequired: true)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller
                                    .countryController,
                                hintText: "Country",
                                margin: getMargin(top: 6)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.emailController,
                                hintText: "lbl_email".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value, isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),
                            Obx(() => CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.passwordController,
                                hintText: "lbl_password".tr,
                                margin: getMargin(top: 20),
                                variant: TextFormFieldVariant.Neutral,
                                padding: TextFormFieldPadding.PaddingT14,
                                fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword.value =
                                          !controller.isShowPassword.value;
                                    },
                                    child: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 14,
                                            right: 15,
                                            bottom: 14),
                                        child: CustomImageView(
                                            svgPath:
                                                controller.isShowPassword.value
                                                    ? ImageConstant.imgEye
                                                    : ImageConstant.imgEye))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48)),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password \n Password should have,\n at least a upper case letter \n at least a lower case letter\n at least a digit \n at least a special character [@#\$%^&+=] \n length of at least 4 \n no white space allowed";
                                  }
                                  return null;
                                },
                                isObscureText: controller.isShowPassword.value)),
                            Padding(
                                padding: getPadding(top: 46, right: 25),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Obx(() => CustomCheckbox(

                                          width: getHorizontalSize(40),
                                          value: controller.isCheckbox.value,
                                          margin: getMargin(top: 1, bottom: 14),
                                          onChange: (value) {
                                            controller.isCheckbox.value = value;
                                          })),
                                      Expanded(
                                          child: Container(
                                              width: getHorizontalSize(276),
                                              margin: getMargin(left: 5),
                                              child: Text(
                                                  "msg_by_clicking_continue".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight14)))
                                    ])),
                            CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_continue".tr,
                                margin: getMargin(top: 17),
                                padding: ButtonPadding.PaddingAll15,
                                onTap: () {
                                  onTapContinue();
                                }),
                            Padding(
                                padding: getPadding(top: 58, bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant.gray200))),
                                      Text("msg_or_continue_with".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtOutfitMedium16),
                                      Padding(
                                          padding: getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant.gray200)))
                                    ]))
                          ]))),
            ),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 108, right: 107, bottom: 38),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgGoogle,
                      height: getSize(32),
                      width: getSize(32)),
                  Container(
                      height: getSize(28),
                      width: getSize(28),
                      margin: getMargin(left: 34, top: 2, bottom: 2),
                      child: Stack(alignment: Alignment.topCenter, children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgGlobe,
                            height: getSize(28),
                            width: getSize(28),
                            alignment: Alignment.center),
                        CustomImageView(
                            svgPath: ImageConstant.imgVolume,
                            height: getVerticalSize(16),
                            width: getHorizontalSize(14),
                            alignment: Alignment.topCenter,
                            margin: getMargin(top: 5))
                      ])),
                  CustomImageView(
                      imagePath: ImageConstant.imgFacebook,
                      height: getSize(32),
                      width: getSize(32),
                      margin: getMargin(left: 34))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  /// Navigates to the phoneVerificationScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the phoneVerificationScreen.
  onTapContinue() async{
    if (!_formKey.currentState!.validate()) {
      return;
    }
     controller.signUp();

  }
}