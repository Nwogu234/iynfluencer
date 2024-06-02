import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';

import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_checkbox.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';


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
                                margin: getMargin(left: 6, top: 7, right: 66,bottom: 34),
                                child: Text("msg_enter_your_details".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtH2Gray600)),

                            Text(
                              "No white spaces",
                              style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700)
                            ),
                            CustomTextFormField(
                                focusNode: controller.firstnameFocusNode,
                                autofocus: true,
                                controller: controller.firstnameController,
                                hintText: "lbl_first_name".tr,
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle: TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null ||!isText(value, isRequired: true)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),

                            CustomTextFormField(
                                focusNode: controller.lastnameFocusNode,
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
                            // CustomTextFormField(
                            //     focusNode: FocusNode(),
                            //     autofocus: true,
                            //     controller: controller
                            //         .countryController,
                            //     hintText: "Country",
                            //     margin: getMargin(top: 6)),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorConstant.gray200,
                        ),
                        margin:  getMargin(top: 20),
                        child: CountryCodePicker(
                          onChanged: (value){
                            controller
                                .countryController=value.name!;
                            print(value.name);
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'GB',
                          favorite: ['+44','GB'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: true,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                        ),
                      ),

                            CustomTextFormField(
                                focusNode: controller.emailFocusNode,
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
                                focusNode: controller.passwordFocusNode,
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
                                    return "Please enter valid password\nPassword should have,\nat least a upper case letter \nat least a lower case letter\nat least a digit \nat least a special character [@#\$%^&+=] \nlength of at least 4 \nno white space allowed";
                                  }
                                  return null;
                                },
                                isObscureText: controller.isShowPassword.value)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => controller.togglePasswordInstructions(),
                            child: Text(
                              "See password instructions",
                              style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Obx(() {
                            if (controller.showPasswordInstructions.value) {
                              return Text(
                                "Password should have,\nat least a upper case letter \nat least a lower case letter\nat least a digit \nat least a special character [@#\$%^&+=] \nlength of at least 4 \nno white space allowed",
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              );
                            } else {
                              return SizedBox.shrink(); // Returns an empty container to hide the text.
                            }
                          }),
                        ],
                      ),

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
                            Obx(() {
                              if (controller.showCheckBoxError.value) {
                                return Text(
                                  "Please accept the terms and conditions to continue",
                                  style: TextStyle(fontSize: 14, color: Colors.red),
                                );
                              } else {
                                return SizedBox.shrink(); // Returns an empty container to hide the text.
                              }
                            }),
                            CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_continue".tr,
                                margin: getMargin(top: 17),
                                padding: ButtonPadding.PaddingAll15,
                                onTap: () {
                                  onTapContinue();
                                }),

                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(top: 17),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Already have an account? "
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
                                                  Get.toNamed(AppRoutes.logInScreen);
                                                },
                                              text: "login".tr,
                                              style: TextStyle(
                                                  color: ColorConstant.cyan300,
                                                  fontSize: getFontSize(14),
                                                  fontFamily: 'Satoshi',
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                        textAlign: TextAlign.left))),
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
                                      // Text("msg_or_continue_with".tr,
                                      //     overflow: TextOverflow.ellipsis,
                                      //     textAlign: TextAlign.left,
                                      //     style: AppStyle.txtOutfitMedium16),
                                      // Padding(
                                      //     padding: getPadding(top: 12, bottom: 7),
                                      //     child: SizedBox(
                                      //         width: getHorizontalSize(99),
                                      //         child: Divider(
                                      //             height: getVerticalSize(1),
                                      //             thickness: getVerticalSize(1),
                                      //             color: ColorConstant.gray200)))
                                    ]))
                          ]))),
            ),
            // bottomNavigationBar: Padding(
            //     padding: getPadding(left: 108, right: 107, bottom: 38),
            //     child:
            //         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //       CustomImageView(
            //           svgPath: ImageConstant.imgGoogle,
            //           height: getSize(32),
            //           width: getSize(32)),
            //       Container(
            //           height: getSize(28),
            //           width: getSize(28),
            //           margin: getMargin(left: 34, top: 2, bottom: 2),
            //           child: Stack(alignment: Alignment.topCenter, children: [
            //             CustomImageView(
            //                 svgPath: ImageConstant.imgGlobe,
            //                 height: getSize(28),
            //                 width: getSize(28),
            //                 alignment: Alignment.center),
            //             CustomImageView(
            //                 svgPath: ImageConstant.imgVolume,
            //                 height: getVerticalSize(16),
            //                 width: getHorizontalSize(14),
            //                 alignment: Alignment.topCenter,
            //                 margin: getMargin(top: 5))
            //           ])),
            //       CustomImageView(
            //           imagePath: ImageConstant.imgFacebook,
            //           height: getSize(32),
            //           width: getSize(32),
            //           margin: getMargin(left: 34))
            //     ]))
    ));
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
  onTapContinue() async {
    // Check if checkbox is not checked
    if (!controller.isCheckbox.value) {
      // Set an error flag or show an error message
      controller.showCheckBoxError.value = true;
      // Return early if checkbox is not checked
      return;
    } else {
      // Reset the checkbox error flag if the checkbox is checked
      controller.showCheckBoxError.value = false;
    }

    // Validate the form
    if (!_formKey.currentState!.validate()) {
      // Return early if validation fails
      return;
    }

    // Proceed with sign-up if all validations pass
    controller.signUp();
  }

}



/* 

Obx(() => Column(
  children: [
    CustomTextFormField(
      focusNode: controller.passwordFocusNode,
      autofocus: true,
      controller: controller.passwordController,
      hintText: "lbl_password".tr,
      margin: getMargin(top: 20),
      variant: TextFormFieldVariant.Neutral,
      padding: TextFormFieldPadding.PaddingT14,
      fontStyle: TextFormFieldFontStyle.SatoshiLight14,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      onChanged: (value) {
        controller.updatePasswordRules(value);
      },
      suffix: InkWell(
        onTap: () {
          controller.isShowPassword.value = !controller.isShowPassword.value;
        },
        child: Container(
          margin: getMargin(left: 30, top: 14, right: 15, bottom: 14),
          child: CustomImageView(
            svgPath: controller.isShowPassword.value ? ImageConstant.imgEye : ImageConstant.imgEye,
          ),
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(48)),
      validator: (value) {
        if (value == null || value.isEmpty || !isValidPassword(value, isRequired: true)) {
          return "Please enter a valid password\nPassword should have,\nat least an upper case letter\nat least a lower case letter\nat least a digit\nat least a special character [@#\$%^&+=]\nlength of at least 4\nno white space allowed";
        }
        return null;
      },
      isObscureText: !controller.isShowPassword.value,
    ),
    ...controller.passwordRules.map((rule) {
      return Obx(() => Row(
        children: [
          Checkbox(
            value: rule.isMet.value,
            onChanged: (value) {},
          ),
          Text(rule.description),
        ],
      ));
    }).toList(),
  ],
)) */