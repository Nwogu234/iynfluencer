import 'controller/payment_transfer_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/validation_functions.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PaymentTransferScreen extends GetWidget<PaymentTransferController> {
  PaymentTransferScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      onTapArrowleft30();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_payment".tr),
                styleType: Style.bgOutlineIndigo50),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 20, top: 21, right: 20, bottom: 21),
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
                              child: Text("lbl_3_678_00".tr,
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
                                    variant: ButtonVariant.FillCyan30066,
                                    padding: ButtonPadding.PaddingAll12,
                                    fontStyle:
                                        ButtonFontStyle.SatoshiBold13WhiteA700),
                                CustomButton(
                                    height: getVerticalSize(38),
                                    width: getHorizontalSize(111),
                                    text: "lbl_bank_transfer".tr,
                                    margin: getMargin(left: 15),
                                    padding: ButtonPadding.PaddingAll12,
                                    fontStyle:
                                        ButtonFontStyle.SatoshiBold13WhiteA700)
                              ])),
                          Padding(
                              padding: getPadding(top: 29),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_account_number".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight13Gray900),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller:
                                            controller.mobilenoController,
                                        hintText: "lbl_2828282822".tr,
                                        margin: getMargin(top: 7),
                                        variant: TextFormFieldVariant.Neutral,
                                        fontStyle: TextFormFieldFontStyle
                                            .SatoshiLight14,
                                        textInputType: TextInputType.phone,
                                        validator: (value) {
                                          if (!isValidPhone(value)) {
                                            return "Please enter valid phone number";
                                          }
                                          return null;
                                        })
                                  ])),
                          Padding(
                              padding: getPadding(top: 21),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_bank_name".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight13Gray900),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller:
                                            controller.frame1006Controller,
                                        hintText: "lbl_crystal_bank".tr,
                                        margin: getMargin(top: 7),
                                        variant: TextFormFieldVariant.Neutral,
                                        fontStyle: TextFormFieldFontStyle
                                            .SatoshiLight14)
                                  ])),
                          Padding(
                              padding: getPadding(top: 21),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_account_name".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight13Gray900),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller:
                                            controller.frame1006oneController,
                                        hintText: "msg_iynfluencer_n_nt".tr,
                                        margin: getMargin(top: 7),
                                        variant: TextFormFieldVariant.Neutral,
                                        fontStyle: TextFormFieldFontStyle
                                            .SatoshiLight14,
                                        textInputAction: TextInputAction.done)
                                  ])),
                          Padding(
                              padding: getPadding(left: 1, top: 25),
                              child: Text("msg_click_done_after".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight14Gray900)),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "lbl_done".tr,
                              margin: getMargin(top: 69, bottom: 5),
                              padding: ButtonPadding.PaddingAll15)
                        ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft30() {
    Get.back();
  }
}
