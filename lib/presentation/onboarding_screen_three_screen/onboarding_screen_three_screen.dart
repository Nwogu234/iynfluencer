import 'controller/onboarding_screen_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

class OnboardingScreenThreeScreen
    extends GetWidget<OnboardingScreenThreeController> {
  const OnboardingScreenThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray90001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 38, right: 20, bottom: 38),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Padding(
                          padding: getPadding(right: 96),
                          child: Row(children: [
                            CustomIconButton(
                                height: 29,
                                width: 28,
                                margin: getMargin(top: 51, bottom: 50),
                                variant: IconButtonVariant.OutlineWhiteA7005e,
                                shape: IconButtonShape.RoundedBorder14,
                                padding: IconButtonPadding.PaddingAll8,
                                onTap: () {
                                  onTapBtnArrowleft();
                                },
                                child: CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowleftWhiteA700)),
                            CustomImageView(
                                svgPath:
                                    ImageConstant.imgOnboardingvectorGray300,
                                height: getVerticalSize(130),
                                width: getHorizontalSize(141),
                                margin: getMargin(left: 68))
                          ])),
                      Padding(
                          padding: getPadding(left: 45, top: 16),
                          child: Text("msg_collaboration_between".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtH2)),
                      CustomImageView(
                          svgPath: ImageConstant.imgGridWhiteA700,
                          height: getVerticalSize(10),
                          width: getHorizontalSize(48),
                          alignment: Alignment.center,
                          margin: getMargin(top: 20)),
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
                          fontStyle: ButtonFontStyle.SatoshiBold14,
                          onTap: () {
                            onTapSignupasan();
                          }),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
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
                                      textAlign: TextAlign.left))))
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
