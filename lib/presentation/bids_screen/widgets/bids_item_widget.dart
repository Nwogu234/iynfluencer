import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';

import '../controller/bids_controller.dart';
import '../models/bids_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore: must_be_immutable
class BidsItemWidget extends StatelessWidget {
  BidsItemWidget(
    this.bidsItemModelObj,
    this.selectedJob,
     {
    Key? key,
  }) : super(
          key: key,
        );

  JobBids bidsItemModelObj;
  Job selectedJob;

  var controller = Get.find<BidsController>();

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SizedBox(
      width: double.maxFinite,
      child: Container(
        margin: getMargin(right: 4, left: 4),
        decoration: AppDecoration.outlineIndigo501,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Container(
                padding: getPadding(
                  left: 25,
                  top: 19,
                  right: 20,
                  bottom: 19,
                ),
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        right: 4,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            fit: BoxFit.cover,
                            url: bidsItemModelObj.influencer!.user!.avatar!,
                            height: getSize(
                              50,
                            ),
                            width: getSize(
                              50,
                            ),
                            radius: BorderRadius.circular(
                              getSize(
                                25.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 13,
                              top: 17,
                              bottom: 12,
                            ),
                            child: Text(
                              "${capitalizeFirstLetter(bidsItemModelObj.influencer!.user!.firstName!)} ${capitalizeFirstLetter(bidsItemModelObj.influencer!.user!.lastName!)}",
                              // bidsItemModelObj..value,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16
                                  .copyWith(fontSize: 16.sp),
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgVector,
                            height: getVerticalSize(
                              13,
                            ),
                            width: getHorizontalSize(
                              13,
                            ),
                            margin: getMargin(
                              top: 24,
                              bottom: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 19,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bid amount: ',
                              style: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                               // text: '\$${bidsItemModelObj.price.toString()}',
                                text: '\$${((bidsItemModelObj.price ?? 0) / 100).toString()}',
                                style: AppStyle.txtSatoshiBold16.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 15)),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        303,
                      ),
                      margin: getMargin(
                        left: 1,
                        top: 12,
                        right: 20,
                      ),
                      child: Text(
                        bidsItemModelObj.coverLetter!,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.gray600,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 22,
                top: 4,
                bottom: 15,
              ),
              child: Row(
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      90,
                    ),
                    text: "lbl_view_details".tr,
                    fontStyle: ButtonFontStyle.SatoshiBold12,
                    onTap: () {
                      onTapViewdetails(bidsItemModelObj, selectedJob);
                    },
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      32,
                    ),
                    width: getHorizontalSize(
                      72,
                    ),
                    text: "lbl_dismiss".tr,
                    margin: getMargin(
                      left: 12,
                    ),
                    variant: ButtonVariant.OutlineIndigo50_2,
                    fontStyle: ButtonFontStyle.SatoshiBold14Black900,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapViewdetails(bidsItemModelObj, selectedJob) {
     final args = BidsArguments(bidsItemModelObj, selectedJob);
    Get.toNamed(AppRoutes.bidRequestScreen, arguments: args);
  }
}
