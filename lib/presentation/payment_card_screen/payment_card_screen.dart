import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';

import 'controller/payment_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_switch.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class PaymentCardScreen extends GetWidget<PaymentCardController> {
   PaymentCardScreen({Key? key}) : super(key: key);

  final argz = Get.arguments as BidsArguments;

  @override
  Widget build(BuildContext context) {
    final JobBids? data = argz.jobBid;
    return SafeArea(
        child: Scaffold(
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
                      onTapArrowleft29();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_payment".tr),
                styleType: Style.bgOutlineIndigo50),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 21, right: 20, bottom: 21),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 1),
                          child: Text("lbl_total_price".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight13)),
                      Padding(
                          padding: getPadding(top: 2),
                          child: Text('\$${data?.price}'.tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold24)),
                      Padding(
                          padding: getPadding(left: 1, top: 29),
                          child: Text("lbl_payment_methods".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiLight13)),
                      Padding(
                          padding: getPadding(top: 5),
                          child: Row(children: [
                            CustomButton(
                                height: getVerticalSize(38),
                                width: getHorizontalSize(95),
                                text: "lbl_debit_card".tr,
                                padding: ButtonPadding.PaddingAll12,
                                fontStyle:
                                    ButtonFontStyle.SatoshiBold13WhiteA700),
                            CustomButton(
                                height: getVerticalSize(38),
                                width: getHorizontalSize(111),
                                text: "lbl_bank_transfer".tr,
                                margin: getMargin(left: 15),
                                variant: ButtonVariant.FillCyan30066,
                                padding: ButtonPadding.PaddingAll12,
                                fontStyle:
                                    ButtonFontStyle.SatoshiBold13WhiteA700)
                          ])),
                          
                    /*   Padding(
                          padding: getPadding(top: 29),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_card_number".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller: controller.languageController,
                                    hintText: "msg".tr,
                                    margin: getMargin(top: 7),
                                    variant: TextFormFieldVariant.Neutral,
                                    padding: TextFormFieldPadding.PaddingT9,
                                    fontStyle:
                                        TextFormFieldFontStyle.SatoshiLight20,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 16,
                                            top: 8,
                                            right: 29,
                                            bottom: 8),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgCloseAmber500)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(46)))
                              ])),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                        padding: getPadding(right: 8),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_valid_until".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight13Gray900),
                                              CustomTextFormField(
                                                  width: getHorizontalSize(159),
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: controller
                                                      .frame1006Controller,
                                                  hintText: "lbl_month_year".tr,
                                                  margin: getMargin(top: 7),
                                                  variant: TextFormFieldVariant
                                                      .Neutral,
                                                  fontStyle:
                                                      TextFormFieldFontStyle
                                                          .SatoshiLight14)
                                            ]))),
                                Expanded(
                                    child: Padding(
                                        padding: getPadding(left: 8),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_cvv".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight13Gray900),
                                              CustomTextFormField(
                                                  width: getHorizontalSize(159),
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: controller
                                                      .languageoneController,
                                                  hintText: "lbl".tr,
                                                  margin: getMargin(top: 7),
                                                  variant: TextFormFieldVariant
                                                      .Neutral,
                                                  padding: TextFormFieldPadding
                                                      .PaddingAll9,
                                                  fontStyle:
                                                      TextFormFieldFontStyle
                                                          .SatoshiLight20)
                                            ])))
                              ])),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_card_holder".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiLight13Gray900),
                                CustomTextFormField(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.frame1006oneController,
                                    margin: getMargin(top: 7),
                                    variant: TextFormFieldVariant.Neutral,
                                    textInputAction: TextInputAction.done)
                              ])), */
                      Padding(
                          padding: getPadding(top: 24, right: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1),
                                    child: Text("msg_save_card_for_payments".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight14Gray900)),
                                Obx(() => CustomSwitch(
                                    value: controller.isSelectedSwitch.value,
                                    onChanged: (value) {
                                      controller.isSelectedSwitch.value = value;
                                    }))
                              ])),
                      CustomButton(
                          height: getVerticalSize(50),
                          text: "Pay \$${data?.price}".tr,
                          margin: getMargin(top: 69, bottom: 5),
                          padding: ButtonPadding.PaddingAll15)
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft29() {
    Get.back();
  }
}
