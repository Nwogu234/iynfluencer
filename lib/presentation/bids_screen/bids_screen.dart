import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../bids_screen/widgets/bids_item_widget.dart';
import 'controller/bids_controller.dart';
import 'models/bids_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

class BidsScreen extends GetWidget<BidsController> {
  BidsScreen({Key? key}) : super(key: key);
  // String? jobId = Get.parameters['id'];
  final Job selectedJob = Get.arguments as Job;
  @override
  Widget build(BuildContext context) {
    String? jobId = selectedJob.jobId;
    return SafeArea(
      child: Scaffold(
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
                  onTapArrowleft2();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_all_bids".tr),
            styleType: Style.bgOutlineIndigo50),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 14, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(left: 22),
                child: Row(
                    // children: [
                    //   RichText(
                    //       text: TextSpan(children: [
                    //         TextSpan(
                    //             text: "lbl_all_bids2".tr,
                    //             style: TextStyle(
                    //                 color: ColorConstant.gray900,
                    //                 fontSize: getFontSize(14),
                    //                 fontFamily: 'Satoshi',
                    //                 fontWeight: FontWeight.w700)),
                    //         TextSpan(
                    //             text: "  ".tr,
                    //             style: TextStyle(
                    //                 color: ColorConstant.gray600,
                    //                 fontSize: getFontSize(14),
                    //                 fontFamily: 'Satoshi',
                    //                 fontWeight: FontWeight.w700)),
                    //         TextSpan(
                    //             text: "lbl_12".tr,
                    //             style: TextStyle(
                    //                 color: ColorConstant.gray600,
                    //                 fontSize: getFontSize(13),
                    //                 fontFamily: 'Satoshi',
                    //                 fontWeight: FontWeight.w700))
                    //       ]),
                    //       textAlign: TextAlign.left),
                    //   CustomImageView(
                    //     svgPath: ImageConstant.imgArrowup,
                    //     height: getSize(20),
                    //     width: getSize(20),
                    //     margin: getMargin(left: 6),
                    //   ),
                    // ],
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: getPadding(top: 4, left: 7, right: 7),
                  child: Obx(
                    () {
                      if (controller.isLoading.value) {
                        // return CustomLoadingWidget(
                        //   animationController: animationController,
                        // );
                        return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: false,
                          separatorBuilder: (
                            context,
                            index,
                          ) {
                            return SizedBox(
                              height: getVerticalSize(
                                10,
                              ),
                            );
                          },
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InfluencerJobBidItemSkeletonWidget(); // Skeleton widget
                          },
                        );
                      } else {
                        if (controller.isError.value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ResponsiveErrorWidget(
                              errorMessage: controller.error.value,
                              onRetry: () {
                                controller.getUser(jobId);
                              },
                              fullPage: true,
                            ),
                          ); // Your error widget
                        } else if (controller.allJobBids.isEmpty &&
                            !controller.isLoading.value) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ResponsiveEmptyWidget(
                              errorMessage: 'No Job Bids Available',
                              buttonText: "Refresh now!",
                              onRetry: () {
                                controller.getUser(jobId);
                              },
                              fullPage: true,
                            ),
                          );
                        } // Your error widget
                        else {
                          return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(1));
                            },
                            itemCount: controller.allJobBids.length,
                            itemBuilder: (context, index) {
                              JobBids model = controller.allJobBids[index];
                              return BidsItemWidget(
                                model,
                                selectedJob
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the bidRequestScreen when the action is triggered.
  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the bidRequestScreen.

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft2() {
    Get.back();
  }
}
