import 'dart:ffi';

import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../jobs_my_bids_influencer_page/widgets/listmediainflue_item_widget.dart';
import 'controller/jobs_my_bids_influencer_controller.dart';
import 'models/jobs_my_bids_influencer_model.dart';
import 'models/listmediainflue_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class JobsMyBidsInfluencerPage extends StatefulWidget {
  JobsMyBidsInfluencerPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<JobsMyBidsInfluencerPage> createState() =>
      _JobsMyBidsInfluencerPageState();
}

class _JobsMyBidsInfluencerPageState extends State<JobsMyBidsInfluencerPage>
    with SingleTickerProviderStateMixin {
  late JobsMyBidsInfluencerController controller;

  // Get.put(JobsMyBidsInfluencerController(JobsMyBidsInfluencerModel().obs));
  final jobsMyBidsInfluencerModelObj = ListmediainflueItemModel();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Create the controller using jobpostingItemList from creatorJobslistModelObj
    // Create the controller using jobpostingItemList from creatorJobslistModelObj
    controller = Get.put(JobsMyBidsInfluencerController(
        // jobsMyBidsInfluencerModelObj.listmediainflueItemList,
        ));
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 14,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 8,
                          bottom: 7,
                        ),
                        child: Text(
                          "lbl_all_bids2".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold14Gray900,
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          35,
                        ),
                        width: getHorizontalSize(
                          83,
                        ),
                        text: "lbl_filter".tr,
                        variant: ButtonVariant.OutlineIndigo50,
                        padding: ButtonPadding.PaddingT8,
                        fontStyle: ButtonFontStyle.SatoshiBold135,
                        prefixWidget: Container(
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSignalBlack900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(
                      top: 10,
                      bottom: 180,
                    ),
                    child: Obx(() {
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
                          return ResponsiveErrorWidget(
                            errorMessage: controller.error.value,
                            onRetry: () {
                              controller.getUser();
                            },
                            fullPage: true,
                          ); // Your error widget
                        } else if (controller
                                .jobsMyBidsInfluencerModelObj.isEmpty &&
                            !controller.isTrendLoading.value) {
                          return ResponsiveEmptyWidget(
                            errorMessage: 'No Job Bids Available',
                            onRetry: () {
                              Get.toNamed(AppRoutes.influencerHomeScreen);
                            },
                            fullPage: true,
                          ); // Your error widget
                        } else {
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
                            itemCount:
                                controller.jobsMyBidsInfluencerModelObj.length,
                            itemBuilder: (context, index) {
                              JobsMyBidsInfluencerModel model = controller
                                  .jobsMyBidsInfluencerModelObj[index];
                              print('-----');
                              print(model.coverLetter);
                              return ListmediainflueItemWidget(
                                model,
                              );
                            },
                          );
                        }
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
