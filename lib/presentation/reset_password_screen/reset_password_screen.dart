import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/presentation/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:iynfluencer/presentation/reset_password_screen/controller/reset_password_controller.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  ResetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            body: Form(
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
                              padding: getPadding(left: 5, top: 22),
                              child: Text("Reset Password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH1)),
                          Container(
                              width: getHorizontalSize(286),
                              margin: getMargin(left: 6, top: 4, right: 42),
                              child: Text("Please enter your email address and your new password".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH2Gray600)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.emailController,
                              hintText: "lbl_email".tr,
                              margin: getMargin(top: 36),
                              variant: TextFormFieldVariant.Neutral,
                              fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Padding(
                            padding: getPadding(top: 12),
                            child: Obx(() => CustomTextFormField(
                                            focusNode:
                                                controller.passwordFocusNode,
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
                                                        color: ColorConstant.gray600,
                                                        svgPath: controller
                                                                .isShowPassword
                                                                .value
                                                            ? ImageConstant.imgEye
                                                            : ImageConstant
                                                                .imgFrameEye))),
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
                          ),
                          CustomButton(
                              onTap: () {
                                onTapPass();
                              },
                              height: getVerticalSize(50),
                              text: "Reset Password".tr,
                              margin: getMargin(top: 17, bottom: 5),
                              padding: ButtonPadding.PaddingAll15)
                        ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

   onTapPass() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.resetPassword();
  }

}
