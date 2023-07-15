import 'controller/forgot_password_controller.dart';import 'package:flutter/material.dart';import 'package:iynfluencer/core/app_export.dart';import 'package:iynfluencer/core/utils/validation_functions.dart';import 'package:iynfluencer/widgets/custom_button.dart';import 'package:iynfluencer/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {ForgotPasswordScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: ColorConstant.whiteA70001, body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: getPadding(left: 20, top: 12, right: 20, bottom: 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(svgPath: ImageConstant.imgArrowleftGray600, height: getSize(30), width: getSize(30), onTap: () {onTapImgArrowleft();}), Padding(padding: getPadding(left: 5, top: 22), child: Text("lbl_forgot_password".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtH1)), Container(width: getHorizontalSize(286), margin: getMargin(left: 6, top: 4, right: 42), child: Text("msg_please_enter_your".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtH2Gray600)), CustomTextFormField(focusNode: FocusNode(), autofocus: true, controller: controller.emailController, hintText: "lbl_email".tr, margin: getMargin(top: 36), variant: TextFormFieldVariant.Neutral, fontStyle: TextFormFieldFontStyle.SatoshiLight14, textInputAction: TextInputAction.done, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "Please enter valid email";} return null;}), CustomButton(height: getVerticalSize(50), text: "lbl_send_link".tr, margin: getMargin(top: 17, bottom: 5), padding: ButtonPadding.PaddingAll15)]))))); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] library to 
/// navigate to the previous screen in the navigation stack.
onTapImgArrowleft() { Get.back(); } 
 }
