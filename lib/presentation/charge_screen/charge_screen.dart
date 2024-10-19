import 'controller/charge_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class ChargeScreen extends GetWidget<ChargeController> {
  const ChargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  onTapArrowleft20();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_submit_charge".tr),
            styleType: Style.bgOutlineIndigo50_1),
        body: Container(
            width: double.maxFinite,
            padding: getPadding(left: 20, top: 27, right: 20, bottom: 27),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("lbl_cover_letter".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight13Gray900),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: controller.frametwelveController,
                            hintText: "msg_explain_briefly".tr,
                            margin: getMargin(top: 7),
                            padding: TextFormFieldPadding.PaddingT38)
                      ]),
                  Padding(
                      padding: getPadding(top: 19),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("lbl_project_charge".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight13Gray900),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.priceController,
                                hintText: "lbl_300".tr,
                                margin: getMargin(top: 6),
                                textInputAction: TextInputAction.done)
                          ])),
                  Padding(
                      padding: getPadding(top: 27, bottom: 5),
                      child: Text("msg_terms_of_contract".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900))
                ])),
        bottomNavigationBar: SafeArea(
          child: Container(
              margin: getMargin(left: 20, right: 20, bottom: 20),
              decoration: AppDecoration.outlineIndigo507,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                        height: getVerticalSize(44),
                        text: "lbl_send".tr,
                        variant: ButtonVariant.Neutral,
                        padding: ButtonPadding.PaddingAll12,
                        fontStyle: ButtonFontStyle.SatoshiBold14Gray600)
                  ])),
        ));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft20() {
    Get.back();
  }
}
