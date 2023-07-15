import 'controller/confirm_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmCodeScreen extends GetWidget<ConfirmCodeController> {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 12, right: 20, bottom: 12),
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
                          child: Text("msg_confirm_your_phone".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtH1)),
                      Container(
                          width: getHorizontalSize(259),
                          margin: getMargin(left: 6, top: 4, right: 69),
                          child: Text("msg_enter_the_code_we".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtH2Gray600)),
                      Padding(
                          padding: getPadding(left: 22, top: 32, right: 22),
                          child: Obx(() => PinCodeTextField(
                              appContext: context,
                              controller: controller.otpController.value,
                              length: 4,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {},
                              pinTheme: PinTheme(
                                  fieldHeight: getHorizontalSize(54),
                                  fieldWidth: getHorizontalSize(54),
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8)),
                                  selectedFillColor: ColorConstant.gray200,
                                  activeFillColor: ColorConstant.gray200,
                                  inactiveFillColor: ColorConstant.gray200,
                                  inactiveColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  selectedColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  activeColor:
                                      ColorConstant.fromHex("#1212121D"))))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 28, bottom: 5),
                              child: Text("lbl_resend_code".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold14)))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(50),
                text: "lbl_done".tr,
                margin: getMargin(left: 20, right: 20, bottom: 43),
                padding: ButtonPadding.PaddingAll15,
                onTap: () {
                  onTapDone();
                })));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleft() {
    Get.back();
  }

  /// Navigates to the completeProfileCreatorScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the completeProfileCreatorScreen.
  onTapDone() {
    Get.toNamed(
      AppRoutes.completeProfileCreatorScreen,
    );
  }
}
