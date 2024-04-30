import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../../widgets/app_bar/influencer_buttom_bar.dart';
import '../jobs_jobs_influencer_page/widgets/listclient_item_widget.dart';
import 'controller/jobs_jobs_influencer_controller.dart';
import 'models/jobs_jobs_influencer_model.dart';
import 'models/listclient_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class JobsJobsInfluencerPage extends StatelessWidget {
  JobsJobsInfluencerPage({Key? key})
      : super(
          key: key,
        );

  JobsJobsInfluencerController controller = Get.put(
      JobsJobsInfluencerController(
          JobsJobsInfluencerModel().listclientItemList));
  late AnimationController animationController;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 14,
              right: 19,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 1,
                    right: 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 9,
                          bottom: 6,
                        ),
                        child: Text(
                          "lbl_all_jobs".tr,
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
                            color: ColorConstant.black900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(
                      top: 18,
                    ),
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        // return CustomLoadingWidget(
                        //   animationController: animationController,
                        // ); // Your custom loading widget
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
                        if (controller.error.value.isNotEmpty) {
                          return ResponsiveErrorWidget(
                            errorMessage: controller.error.value,
                            onRetry: () {
                              controller.getUser();
                            },
                            fullPage: true,
                          ); // Your error widget
                        } else if (controller.isEpty.value) {
                          return ResponsiveEmptyWidget(
                            errorMessage: 'You have not gotten any jobs',
                            buttonText: "Bid on jobs now!",
                            onRetry: () {
                              controller.infTabcont.currentRoute.value=AppRoutes.influencerHomeScreen;
                              Navigator.of(Get.nestedKey(3)!.currentState!.context).pushReplacementNamed(AppRoutes.influencerHomeScreen);
                              controller.bumcont.selectedIndex.value=0;
                            },
                            fullPage: true,
                          ); //
                        } else {
                          return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  23,
                                ),
                              );
                            },
                            itemCount: controller
                                .jobsJobsInfluencerModelObj.value.length,
                            itemBuilder: (context, index) {
                              Job model = controller
                                  .jobsJobsInfluencerModelObj.value[index];
                              return ListclientItemWidget(
                                model,
                              );
                            },
                          );
                        }
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
