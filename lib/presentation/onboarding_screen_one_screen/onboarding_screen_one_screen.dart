import 'controller/onboarding_screen_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

class OnboardingScreenOneScreen
    extends GetWidget<OnboardingScreenOneController> {
  const OnboardingScreenOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).viewInsets.bottom;
    
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray90001,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.fromLTRB(20, 38, 20, space + 38),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(left: 86),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgOnboardingvector,
                                        height: getVerticalSize(130),
                                        width: getHorizontalSize(150)),
                                    CustomIconButton(
                                        height: 29,
                                        width: 28,
                                        margin: getMargin(
                                            left: 57, top: 50, bottom: 51),
                                        variant: IconButtonVariant
                                            .OutlineWhiteA7005e,
                                        shape: IconButtonShape.RoundedBorder14,
                                        padding: IconButtonPadding.PaddingAll8,
                                        onTap: () {
                                          onTapBtnArrowleft();
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowleft))
                                  ]))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 33, top: 17),
                              child: Text("msg_get_paid_by_growing".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtH2))),
                      CustomImageView(
                          svgPath: ImageConstant.imgGrid,
                          height: getVerticalSize(10),
                          width: getHorizontalSize(48),
                          margin: getMargin(top: 19)),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "msg_sign_up_as_a_creator".tr,
                          margin: getMargin(top: 89),
                          variant: ButtonVariant.Neutral,
                          padding: ButtonPadding.PaddingAll15,
                          fontStyle: ButtonFontStyle.SatoshiBold14,
                          onTap: () {
                            onTapSignupasa();
                          }),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "msg_sign_up_as_an_influencer".tr,
                          margin: getMargin(top: 34),
                          padding: ButtonPadding.PaddingAll15,
                          fontStyle: ButtonFontStyle.SatoshiBold14Gray90002,
                          onTap: () {
                            onTapSignupasan();
                          }),
                      GestureDetector(
                          onTap: () {
                            onTapTxtAlreadyhavean();
                          },
                          child: Padding(
                              padding: getPadding(top: 126),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_already_have_an2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray200,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w300)),
                                    TextSpan(
                                        text: "lbl_sign_in".tr,
                                        style: TextStyle(
                                            color: ColorConstant.cyan300,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w300))
                                  ]),
                                  textAlign: TextAlign.left)))
                    ]))));
  }

  /// Navigates to the onboardingScreenTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the onboardingScreenTwoScreen.
  onTapBtnArrowleft() {
    Get.toNamed(
      AppRoutes.onboardingScreenTwoScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the signUpScreen.
  onTapSignupasa() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the signUpScreen.
  onTapSignupasan() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

  /// Navigates to the logInScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the logInScreen.
  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}
