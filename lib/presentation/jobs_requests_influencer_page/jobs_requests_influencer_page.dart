import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../jobs_requests_influencer_page/widgets/listgroup855_item_widget.dart';
import 'controller/jobs_requests_influencer_controller.dart';
import 'models/jobs_requests_influencer_model.dart';
import 'models/listgroup855_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class JobsRequestsInfluencerPage extends StatefulWidget {
  JobsRequestsInfluencerPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<JobsRequestsInfluencerPage> createState() =>
      _JobsRequestsInfluencerPageState();
}

class _JobsRequestsInfluencerPageState extends State<JobsRequestsInfluencerPage>
    with SingleTickerProviderStateMixin {
  JobsRequestsInfluencerController controller =
      Get.put(JobsRequestsInfluencerController());

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
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
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: getPadding(
                    left: 20,
                    // top: 22,
                    right: 20,
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
                        return Padding(
                           padding: const EdgeInsets.only(
                            bottom: 350
                          ),
                          child: ResponsiveErrorWidget(
                            errorMessage: controller.error.value,
                            onRetry: () {
                              controller.getUser();
                            },
                            fullPage: true,
                          ),
                        ); // Your error widget
                      } else if (controller
                              .jobsRequestsInfluencerModelObj.isEmpty &&
                          !controller.isTrendLoading.value) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 350
                          ),
                          child: Center(
                            child: ResponsiveEmptyWidget(
                              errorMessage: 'You have (0) Jobs Requests',
                              smallMessage: 'Your past Requests will appear here',
                              buttonText: "Retry Now",
                              onRetry: () {
                                controller.getUser();
                              },
                              fullPage: true,
                            ),
                          ),
                        ); // Your error widget
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
                                22,
                              ),
                            );
                          },
                          itemCount: controller
                              .jobsRequestsInfluencerModelObj.value.length,
                          itemBuilder: (context, index) {
                            JobsRequestsInfluencerModel model = controller
                                .jobsRequestsInfluencerModelObj.value[index];
                            return Listgroup855ItemWidget(
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
    );
  }
}
