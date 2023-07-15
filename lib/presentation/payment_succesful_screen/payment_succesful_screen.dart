import 'controller/payment_succesful_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PaymentSuccesfulScreen extends GetWidget<PaymentSuccesfulController> {
  const PaymentSuccesfulScreen({Key? key})
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
                imagePath: ImageConstant.imgIcons8checkmark,
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
                  "msg_payment_successful".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold20,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  292,
                ),
                margin: getMargin(
                  left: 21,
                  top: 5,
                  right: 20,
                  bottom: 5,
                ),
                child: Text(
                  "msg_your_payment_as".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtH2Gray600,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(
            46,
          ),
          text: "lbl_done".tr,
          margin: getMargin(
            left: 20,
            right: 20,
            bottom: 31,
          ),
          padding: ButtonPadding.PaddingAll15,
        ),
      ),
    );
  }
}
