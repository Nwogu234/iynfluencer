import 'package:iynfluencer/data/general_controllers/user_controller.dart';

import 'controller/withdrawal_successful_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class WithdrawalSuccessfulScreen
    extends GetWidget<WithdrawalSuccessfulController> {
  WithdrawalSuccessfulScreen({Key? key})
      : super(
          key: key,
        );

  final UserController user = Get.find();

  late final String amount = Get.parameters['amount'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            GestureDetector(
              onTap: () {
                onTapArrowleft32();
              },
              child: CustomImageView(
                svgPath: ImageConstant.imgCancel,
                height: getSize(
                  36,
                ),
                width: getSize(
                  36,
                ),
                alignment: Alignment.centerRight,
              ),
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
                top: 33,
              ),
              child: Text(
                "msg_withdrawal_successful".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold20,
              ),
            ),
            Container(
              width: getHorizontalSize(
                270,
              ),
              margin: getMargin(
                left: 32,
                top: 6,
                right: 31,
                bottom: 5,
              ),
              child: Text(
                "You’ve successfully withdrawn \${$amount} from your account."
                    .tr,
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtH2Gray600,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomButton(
          onTap: () {
            onTapArrowleft32();
          },
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

  onTapArrowleft32() {
    Get.back();
  }
}
