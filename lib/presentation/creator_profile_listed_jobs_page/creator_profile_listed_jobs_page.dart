import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/creator_job_details/controller/creator_job_detail_controller.dart';
import 'package:iynfluencer/presentation/creator_job_details/creator_job_details_screen.dart';
import 'package:iynfluencer/presentation/creator_profile_listed_jobs_page/widgets/creator_profile_listed_job_item.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import 'controller/creator_profile_listed_jobs_controller.dart';
import 'models/creator_profile_listed_jobs_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CreatorProfileListedJobsPage extends StatefulWidget {
  CreatorProfileListedJobsPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<CreatorProfileListedJobsPage> createState() => _CreatorProfileListedJobsPageState();
}

class _CreatorProfileListedJobsPageState extends State<CreatorProfileListedJobsPage>
with SingleTickerProviderStateMixin {

    BottomBarController bumcont = Get.put(BottomBarController());
  HomeCreatorContainerController homcont =
      Get.put(HomeCreatorContainerController());
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late CreatorProfileListedJobsController controller;  
  late AnimationController animationController;

  final creatorJobslistModelObj = CreatorProfileListedJobsModel();

  
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
     controller = Get.put( CreatorProfileListedJobsController(
      creatorJobslistModelObj.jobpostingItemList,
    ));
  }

    @override
   void dispose() {
    animationController.dispose();
    bumcont.dispose();
    homcont.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body:Obx(() {
           if (controller.isTrendLoading.value) {
              return CustomLoadingWidget(
                animationController: animationController,
              );
            } else if (controller.error.value.isNotEmpty) {
              return ResponsiveErrorWidget(
                errorMessage: controller.error.value,
                onRetry: () {
                  controller.getJob();
                  // ... [rest of the error handling code]
                },
                fullPage: true,
              );
            } else if (controller.empty) {
              return ResponsiveEmptyWidget(
                errorMessage: 'You have no posts yet',
                smallMessage: 'Your past posts will appear here',
                buttonText: "Post a new job",
                onRetry: () {
                  homcont.currentRoute.value = AppRoutes.postPageScreen;
                  Navigator.of(Get.nestedKey(1)?.currentState?.context ?? context)
                      .pushReplacementNamed(AppRoutes.postPageScreen);
                  bumcont.selectedIndex.value = 2;
                },
                fullPage: true,
              );
            }else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.isTrendLoading.value
                            ? 5
                            : controller.existingJobs.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 0.1,
                          );
                        },
                        itemBuilder: (context, index) {
                          if (controller.isTrendLoading.value) {
                            return TrendinghorizonItemSkeletonWidget();
                          } else {
                            Job model = controller.existingJobs[index];
                            return CreatorProfileListedJobItem(
                              creatorJobslistModelObj: model,
                              index: index,
                              onTapDetailcard: () {
                                onTapDetailcard(model);
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
        })
      ),
    );
  }

  onTapDetailcard(Job selectedJob) {
    final jobDetailsController = Get.put(CreatorJobDetailsController());
    jobDetailsController.setSelectedJob(selectedJob);
    Get.to(
      () => CreatorJobDetailsScreen(selectedJob: selectedJob),
    );
  }
}
