import 'controller/payment_failed_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PaymentFailedScreen extends GetWidget<PaymentFailedController> {
  const PaymentFailedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 20,
            top: 23,
            right: 20,
            bottom: 23,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgCancel,
                height: getSize(
                  36,
                ),
                width: getSize(
                  36,
                ),
                alignment: Alignment.centerRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIcons8error1,
                height: getSize(
                  54,
                ),
                width: getSize(
                  54,
                ),
                margin: getMargin(
                  top: 84,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 35,
                ),
                child: Text(
                  "lbl_payment_failed".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold20,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  268,
                ),
                margin: getMargin(
                  left: 33,
                  top: 5,
                  right: 32,
                ),
                child: Text(
                  "msg_your_transaction".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtH2Gray600,
                ),
              ),
              Spacer(),
              CustomButton(
                height: getVerticalSize(
                  46,
                ),
                text: "lbl_make_paymet".tr,
                padding: ButtonPadding.PaddingAll15,
              ),
              CustomButton(
                height: getVerticalSize(
                  19,
                ),
                width: getHorizontalSize(
                  46,
                ),
                text: "lbl_cancel".tr,
                margin: getMargin(
                  top: 25,
                  bottom: 10,
                ),
                fontStyle: ButtonFontStyle.SatoshiBold14Gray900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
