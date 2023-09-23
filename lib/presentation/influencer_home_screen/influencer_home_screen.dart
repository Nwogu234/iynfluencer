import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/influencer_drawer_item/controller/influencer_drawer_controller.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/widgets/app_bar/influencer_buttom_bar.dart';

import '../../data/models/Jobs/job_model.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/skeletons.dart';
import '../influencer_drawer_item/influencer_drawer.dart';
import '../influencer_home_screen/widgets/influencer_home_item_widget.dart';
import '../jobs_jobs_influencer_tab_container_screen/jobs_jobs_influencer_tab_container_screen.dart';
import 'controller/influencer_home_controller.dart';
import 'models/influencer_home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';

import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

import 'models/influencer_home_model.dart';

class InfluencerHomeScreen extends StatefulWidget {
  InfluencerHomeScreen({Key? key}) : super(key: key);

  @override
  _InfluencerHomeScreenState createState() => _InfluencerHomeScreenState();
}

class _InfluencerHomeScreenState extends State<InfluencerHomeScreen>
    with SingleTickerProviderStateMixin {
  InfluencerHomeController controller =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            key: _scaffoldKey,
            drawer: InfluencerDraweritem(controller),
            backgroundColor: ColorConstant.whiteA70001,
            appBar: CustomAppBar(
                height: getVerticalSize(63),
                leadingWidth: 55,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imgGroup899,
                    margin:
                        EdgeInsets.only(left: 20.w, top: 14.h, bottom: 14.h),
                    onTap: () {
                      openDrawer();
                    }),
                title: AppbarSearchview(
                    margin: getMargin(left: 14),
                    hintText: "msg_search_creators".tr,
                    controller: controller.searchController),
                styleType: Style.bgOutlineIndigo50),
            body: Container(
              width: double.maxFinite,
              padding: getPadding(left: 19, top: 10, right: 19, bottom: 10),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return CustomLoadingWidget(
                    animationController: animationController,
                  ); // Your custom loading widget
                } else if (controller.error.value.isNotEmpty) {
                  return ResponsiveErrorWidget(
                    errorMessage: controller.error.value,
                    onRetry: controller.getUser, // Remove the parentheses
                    fullPage: true,
                  ); // Your error widget
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(top: 13),
                            child: Text("lbl_recent_postings".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900)),
                        Expanded(
                            child: Padding(
                                padding: getPadding(top: 19),
                                child: Obx(() => ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(16));
                                    },
                                    itemCount: controller.isJobsLoading.value
                                        ? 5
                                        : controller.jobsList.length,
                                    itemBuilder: (context, index) {
                                      if (controller.isJobsLoading.value) {
                                        return InfluencerHomeItemSkeletonWidget();
                                      } else {
                                        Job model = controller.jobsList[index];
                                        return InfluencerHomeItemWidget(model,
                                            onTapJobpost: () {
                                          onTapJobpost(model);
                                        });
                                      }
                                    }))))
                      ]);
                }
              }),
              // bottomNavigationBar:
              //     InfluencerBottomBar(onChanged: (BottomBarEnum type) {
              //   Get.toNamed(getCurrentRoute(type), id: 1);
              // })
            )));
  }

  // ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.influencerHomeScreen;
  //     case BottomBarEnum.Jobs:
  //       return AppRoutes.jobsJobsInfluencerPage;
  //
  //     case BottomBarEnum.Chats:
  //       return AppRoutes.messagesPage;
  //     case BottomBarEnum.Community:
  //       return AppRoutes.communityPage;
  //     default:
  //       return "/";
  //   }
  // }
  //
  // ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.influencerHomeScreen:
  //       return InfluencerHomeScreen();
  //     case AppRoutes.jobsJobsInfluencerTabContainerScreen:
  //       return JobsJobsInfluencerTabContainerScreen();
  //
  //     case AppRoutes.messagesPage:
  //       return MessagesPage();
  //     case AppRoutes.communityPage:
  //       return CommunityPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  /// Navigates to the jobDetailsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the jobDetailsScreen.
  onTapJobpost(model) {
    Get.to(JobDetailsScreen(
      selectedJob: model,
    ));
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
