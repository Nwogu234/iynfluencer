import 'controller/phone_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_drop_down.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PhoneVerificationScreen extends GetWidget<PhoneVerificationController> {
  PhoneVerificationScreen({Key? key}) : super(key: key);

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
                              child: Text("msg_enter_your_phone".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH1)),
                          Padding(
                              padding: getPadding(left: 6, top: 16),
                              child: Text("msg_we_will_send_an".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH2Gray600)),
                          Padding(
                              padding: getPadding(top: 48, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomDropDown(
                                        width: getHorizontalSize(101),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        icon: Container(
                                            margin:
                                                getMargin(right: 10),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdown)),
                                        hintText: "lbl_234".tr,
                                        fontStyle:
                                            DropDownFontStyle.SatoshiLight14,
                                        items: controller
                                            .phoneVerificationModelObj
                                            .value
                                            .dropdownItemList
                                            .value,
                                        onChanged: (value) {
                                          controller.onSelected(value);
                                        }),
                                    CustomTextFormField(
                                        width: getHorizontalSize(233),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller:
                                            controller.phonenumberController,
                                        hintText: "lbl_phone_number".tr,
                                        variant: TextFormFieldVariant.Neutral,
                                        fontStyle: TextFormFieldFontStyle
                                            .SatoshiLight14,
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.phone,
                                        validator: (value) {
                                          if (!isValidPhone(value)) {
                                            return "Please enter valid phone number";
                                          }
                                          return null;
                                        })
                                  ]))
                        ]))),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(50),
                text: "lbl_send_code".tr,
                margin: getMargin(left: 20, right: 20, bottom: 45),
                variant: ButtonVariant.Neutral,
                padding: ButtonPadding.PaddingAll15,
                fontStyle: ButtonFontStyle.SatoshiBold14Gray600,
                onTap: () {
                  onTapSendcode();
                })));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  /// Navigates to the confirmCodeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the confirmCodeScreen.
  onTapSendcode() {
    Get.toNamed(
      AppRoutes.confirmCodeScreen,
    );
  }
}
