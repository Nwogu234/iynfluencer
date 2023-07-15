import 'controller/dispute_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class DisputeSentScreen extends GetWidget<DisputeSentController> {
  const DisputeSentScreen({Key? key})
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
                imagePath: ImageConstant.imgIcons8messageread,
                height: getSize(
                  40,
                ),
                width: getSize(
                  40,
                ),
                margin: getMargin(
                  top: 91,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 42,
                ),
                child: Text(
                  "lbl_dispute_sent".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold20,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  300,
                ),
                margin: getMargin(
                  left: 17,
                  top: 5,
                  right: 17,
                  bottom: 5,
                ),
                child: Text(
                  "msg_your_dispute_request".tr,
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
            19,
          ),
          width: getHorizontalSize(
            101,
          ),
          text: "lbl_return_to_home".tr,
          margin: getMargin(
            left: 137,
            right: 137,
            bottom: 44,
          ),
          fontStyle: ButtonFontStyle.SatoshiBold14Gray900,
        ),
      ),
    );
  }
}
