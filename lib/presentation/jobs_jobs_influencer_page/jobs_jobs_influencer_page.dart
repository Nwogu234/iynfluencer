import 'package:flutter_animate/flutter_animate.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/controller/messages_page_influencer_controller.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/models/messages_page_influencer_model.dart';
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
  JobsJobsInfluencerController()
);
  late AnimationController animationController;
     final  MessagesPageInfluencerController messagesController =
      Get.put( MessagesPageInfluencerController()); 

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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: getVerticalSize(360),
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
                              return InfluencerJobBidItemSkeletonWidget(); 
                            },
                          );
                        } else {
                          if (controller.error.value.isNotEmpty) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 350,
                                ),
                              child: ResponsiveErrorWidget(
                                errorMessage: controller.error.value,
                                onRetry: () {
                                  controller.getUser();
                                },
                                fullPage: true,
                              ),
                            ); // Your error widget
                          } else if (controller.isEpty.value) {
                            return Padding(
                            padding: const EdgeInsets.only(
                               bottom: 350
                             ),
                              child: Center(
                                child: ResponsiveEmptyWidget(
                                  errorMessage: 'You have no current Jobs ',
                                  smallMessage:
                                      'Your past and present Jobs will appear here',
                                  buttonText: "Retry Now",
                                  onRetry: () {
                                    controller.getUser();
                                  },
                                  fullPage: true,
                                ),
                              ),
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
                               itemCount: controller.isTrendLoading.value
                                   ? 5  
                              : controller.jobsJobsInfluencerModelObj.value.listclientItemList.length,  // Use the length of the job list
                            itemBuilder: (context, index) {
                            Jobz? model = index <
                                controller.jobsJobsInfluencerModelObj.value.listclientItemList.length
                              ? controller.jobsJobsInfluencerModelObj.value.listclientItemList[index]
                               : null;
                                ChatData? chatData = 
                                           index < messagesController.chatList.length
                                          ? messagesController.chatList[index]
                                          : null;
                             return Animate(
                               effects:[MoveEffect(duration: Duration(seconds:1)),FadeEffect(duration: Duration(seconds:1))],
                               child: ListclientItemWidget(
                                 model,
                                 chatData
                                 ),
                             );
                               },
                            );
                          }
                        }
                      }),
                    ),
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
