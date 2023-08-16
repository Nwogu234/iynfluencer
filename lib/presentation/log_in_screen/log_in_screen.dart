import 'package:flutter/gestures.dart';

import 'controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends GetWidget<LogInController> {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA70001,
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                                padding: getPadding(left: 5, top: 22),
                                child: Text("msg_login_to_account".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH1)),
                            Container(
                                width: getHorizontalSize(274),
                                margin: getMargin(left: 6, top: 4, right: 54),
                                child: Text("msg_welcome_back_please".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray600)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.usernameController,
                                hintText: "lbl_email_username".tr,
                                margin: getMargin(top: 36),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),
                            Padding(
                                padding: getPadding(top: 22),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(() => CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller:
                                              controller.passwordController,
                                          hintText: "lbl_password".tr,
                                          variant: TextFormFieldVariant.Neutral,
                                          padding:
                                              TextFormFieldPadding.PaddingT14,
                                          fontStyle: TextFormFieldFontStyle
                                              .SatoshiLight14,
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: InkWell(
                                              onTap: () {
                                                controller
                                                        .isShowPassword.value =
                                                    !controller
                                                        .isShowPassword.value;
                                              },
                                              child: Container(
                                                  margin: getMargin(
                                                      left: 30,
                                                      top: 14,
                                                      right: 15,
                                                      bottom: 14),
                                                  child: CustomImageView(
                                                      svgPath: controller
                                                              .isShowPassword
                                                              .value
                                                          ? ImageConstant.imgEye
                                                          : ImageConstant
                                                              .imgEye))),
                                          suffixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(48)),
                                          // validator: (value) {
                                          //   if (value == null ||
                                          //       (!isValidPassword(value,
                                          //           isRequired: true))) {
                                          //     return "Please enter valid password";
                                          //   }
                                          //   return null;
                                          // },
                                          isObscureText:
                                              controller.isShowPassword.value)),
                                      GestureDetector(
                                          onTap: () {
                                            onTapTxtForgotpassword();
                                          },
                                          child: Padding(
                                              padding: getPadding(top: 9),
                                              child: Text(
                                                  "msg_forgot_password".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold13)))
                                    ])),
                            CustomButton(
                                onTap: onTapContinue,
                                height: getVerticalSize(50),
                                text: "lbl_log_in".tr,
                                margin: getMargin(top: 24),
                                padding: ButtonPadding.PaddingAll15),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(top: 17),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "msg_don_t_have_an_account2"
                                                  .tr,
                                              style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(14),
                                                  fontFamily: 'Satoshi',
                                                  fontWeight: FontWeight.w700)),
                                          TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Handle the tap event here
                                                  Get.toNamed(AppRoutes.signUpScreen);
                                                },
                                              text: "lbl_create_account".tr,
                                              style: TextStyle(
                                                  color: ColorConstant.cyan300,
                                                  fontSize: getFontSize(14),
                                                  fontFamily: 'Satoshi',
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                        textAlign: TextAlign.left))),
                            Padding(
                                padding: getPadding(top: 68),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.gray200))),
                                      Text("msg_or_continue_with".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtOutfitMedium16),
                                      Padding(
                                          padding:
                                              getPadding(top: 12, bottom: 7),
                                          child: SizedBox(
                                              width: getHorizontalSize(99),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.gray200)))
                                    ])),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(top: 37, bottom: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgGoogle,
                                              height: getSize(32),
                                              width: getSize(32)),
                                          Container(
                                              height: getSize(28),
                                              width: getSize(28),
                                              margin: getMargin(
                                                  left: 34, top: 2, bottom: 2),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGlobe,
                                                        height: getSize(28),
                                                        width: getSize(28),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVolume,
                                                        height:
                                                            getVerticalSize(16),
                                                        width:
                                                            getHorizontalSize(
                                                                14),
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin:
                                                            getMargin(top: 5))
                                                  ])),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFacebook,
                                              height: getSize(32),
                                              width: getSize(32),
                                              margin: getMargin(left: 34))
                                        ])))
                          ])),
                ))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  onTapContinue() {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    controller.logIn();
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the forgotPasswordScreen.
  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }
}
