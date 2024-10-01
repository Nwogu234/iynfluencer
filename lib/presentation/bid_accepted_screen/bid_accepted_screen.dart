import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/influencer_tabs/contoller/influencers_tabs_controller.dart';
import 'package:iynfluencer/presentation/request_accepted_screen/controller/request_accepted_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class BidAcceptedScreen extends GetWidget<RequestAcceptedController> {
  BidAcceptedScreen({Key? key})
      : super(
          key: key,
        );


  late final String jobId = Get.parameters['jobId'] ?? '';


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
                "Job Bid Submitted".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiBold20,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 4,
                bottom: 5,
              ),
              child: Text(
                "You have successfully bid Job for Job ID;  $jobId".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtH2Gray600,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomButton(
          onTap: () {
            Get.back();
          },
          height: getVerticalSize(
            46,
          ),
          text: "Done".tr,
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
