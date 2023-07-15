import '../onboarding_screen_two_screen/widgets/sliderarrowleft_item_widget.dart';
import 'controller/onboarding_screen_two_controller.dart';
import 'models/sliderarrowleft_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenTwoScreen
    extends GetWidget<OnboardingScreenTwoController> {
  const OnboardingScreenTwoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray90001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 38, right: 20, bottom: 38),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Spacer(),
                      Obx(() => CarouselSlider.builder(
                          options: CarouselOptions(
                              height: getVerticalSize(169),
                              initialPage: 0,
                              autoPlay: true,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                controller.sliderIndex.value = index;
                              }),
                          itemCount: controller.onboardingScreenTwoModelObj
                              .value.sliderarrowleftItemList.value.length,
                          itemBuilder: (context, index, realIndex) {
                            SliderarrowleftItemModel model = controller
                                .onboardingScreenTwoModelObj
                                .value
                                .sliderarrowleftItemList
                                .value[index];
                            return SliderarrowleftItemWidget(model);
                          })),
                      Obx(() => Container(
                          height: getVerticalSize(10),
                          margin: getMargin(top: 19),
                          child: AnimatedSmoothIndicator(
                              activeIndex: controller.sliderIndex.value,
                              count: controller.onboardingScreenTwoModelObj
                                  .value.sliderarrowleftItemList.value.length,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                  spacing: 9,
                                  activeDotColor: ColorConstant.whiteA700,
                                  dotColor: ColorConstant.blueGray1007f,
                                  dotHeight: getVerticalSize(10),
                                  dotWidth: getHorizontalSize(10))))),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "Create an account",
                          margin: getMargin(top: 89),
                          variant: ButtonVariant.Neutral,
                          padding: ButtonPadding.PaddingAll15,
                          fontStyle: ButtonFontStyle.SatoshiBold14,
                          onTap: () {
                            onTapSignupasa();
                          }),
                      // CustomButton(
                      //     height: getVerticalSize(50),
                      //     text: "msg_sign_up_as_an_influencer".tr,
                      //     margin: getMargin(top: 34),
                      //     padding: ButtonPadding.PaddingAll15,
                      //     fontStyle: ButtonFontStyle.SatoshiBold14,
                      //     onTap: () {
                      //       onTapSignupasan();
                      //     }),
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

  /// Navigates to the onboardingScreenOneScreen when the action is triggered.
  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the onboardingScreenOneScreen.
  // onTapBtnArrowleft() {
  //   Get.toNamed(AppRoutes.onboardingScreenOneScreen);
  // }

  /// Navigates to the onboardingScreenThreeScreen when the action is triggered.
  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the onboardingScreenThreeScreen.
  // onTapBtnArrowleftone() {
  //   Get.toNamed(AppRoutes.onboardingScreenThreeScreen);
  // }

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
  // onTapSignupasan() {
  //   Get.toNamed(
  //     AppRoutes.signUpScreen,
  //   );
  // }

  /// Navigates to the logInScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the logInScreen.
  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}
