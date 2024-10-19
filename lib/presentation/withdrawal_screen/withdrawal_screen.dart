import 'package:iynfluencer/data/general_controllers/user_controller.dart';

import 'controller/withdrawal_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_switch.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class WithdrawalScreen extends StatelessWidget {
  WithdrawalScreen({Key? key}) : super(key: key);

  final UserController user = Get.find();
  final WithdrawalController controller = Get.put(WithdrawalController());

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
                  onTapArrowleft32();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_withdrawal".tr),
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
                      child: Text("lbl_total_amount".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13)),
                  Padding(
                      padding: getPadding(top: 2),
                      child: Text(
                          '\$${((user.userModelObj.value.balance) / 100).toString()}'
                              .tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold24)),
                  Padding(
                      padding: getPadding(left: 1, top: 29),
                      child: Text("msg_input_account_details".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13)),
                  Padding(
                      padding: getPadding(top: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("lbl_account_number".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight13Gray900),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: false,
                                controller: controller.accNumberController,
                                hintText: "lbl_1234567890".tr,
                                margin: getMargin(top: 7),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your account number';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done)
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
                                style: AppStyle.txtSatoshiLight13Gray900),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: false,
                                controller: controller.bankNameController,
                                hintText: "lbl_input_your_bank".tr,
                                margin: getMargin(top: 7),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your bank name';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done)
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
                                style: AppStyle.txtSatoshiLight13Gray900),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: false,
                                controller: controller.accNameController,
                                hintText: "msg_your_account_name".tr,
                                margin: getMargin(top: 7),
                                variant: TextFormFieldVariant.Neutral,
                                fontStyle:
                                    TextFormFieldFontStyle.SatoshiLight14,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your account name';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done)
                          ])),
                  Padding(
                      padding: getPadding(left: 1, top: 29, right: 26),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("msg_save_details_for".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight14Gray900),
                            Obx(() => CustomSwitch(
                                value: controller.isSelectedSwitch.value,
                                onChanged: (value) {
                                  controller.isSelectedSwitch.value = value;
                                }))
                          ])),
                  Spacer(),
                  CustomButton(
                      onTap: () {
                        controller.submitWithdrawal(
                            context,
                            user.userModelObj.value.balance,
                            user.userModelObj.value.userId);
                      },
                      height: getVerticalSize(50),
                      text: "lbl_done".tr,
                      margin: getMargin(bottom: 81),
                      padding: ButtonPadding.PaddingAll15)
                ])));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft32() {
    Get.back();
  }
}
