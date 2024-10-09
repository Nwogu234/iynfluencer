import 'controller/dispute_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_radio_button.dart';

class DisputeScreen extends GetWidget<DisputeController> {
   DisputeScreen({Key? key}) : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 50,
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 20, top: 9, bottom: 9),
                    onTap: () {
                      onTapArrowleft31();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_dispute".tr),
                styleType: Style.bgOutlineIndigo50_1),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 32, right: 20, bottom: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_select_why_you_want".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtH1),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Obx(() => Column(children: [
                                CustomRadioButton(
                                    text: "msg_influencer_didn_t".tr,
                                    value: controller.disputeModelObj.value
                                        .radioList.value[0],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(right: 1),
                                    fontStyle: RadioFontStyle.SatoshiLight14,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(324),
                                    text: "msg_no_feedbacks_from".tr,
                                    iconSize: getHorizontalSize(12),
                                    value: controller.disputeModelObj.value
                                        .radioList.value[1],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 15),
                                    fontStyle: RadioFontStyle.SatoshiLight14,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    }),
                                CustomRadioButton(
                                    width: getHorizontalSize(318),
                                    text: "msg_influencer_didn_t2".tr,
                                    iconSize: getHorizontalSize(12),
                                    value: controller.disputeModelObj.value
                                        .radioList.value[2],
                                    groupValue: controller.radioGroup.value,
                                    margin: getMargin(top: 16, right: 6),
                                    fontStyle: RadioFontStyle.SatoshiLight14,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.radioGroup.value = value;
                                    })
                              ]))),
                      SizedBox(
                          width: double.maxFinite,
                          child: Container(
                              width: getHorizontalSize(335),
                              margin: getMargin(top: 46, bottom: 5),
                              padding: getPadding(
                                  left: 8, top: 14, right: 8, bottom: 14),
                              decoration: AppDecoration.outlineGray20002
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder7),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(304),
                                        margin:
                                            getMargin(right: 14, bottom: 96),
                                        child: Text("msg_kindly_state_your".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiLight13))
                                  ])))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(84),
                text: "lbl_send2".tr,
                margin: getMargin(bottom: 18),
                variant: ButtonVariant.OutlineIndigo50_3,
                shape: ButtonShapes.Square,
                padding: ButtonPadding.PaddingT32,
                fontStyle: ButtonFontStyle.SatoshiBold14Gray900)));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
 void onTapArrowleft31() async {  
    Get.back();
}
}
