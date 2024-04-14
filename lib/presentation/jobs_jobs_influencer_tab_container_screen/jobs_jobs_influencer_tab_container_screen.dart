import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/jobs_my_bids_influencer_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';

import '../jobs_requests_influencer_page/jobs_requests_influencer_page.dart';
import 'controller/jobs_jobs_influencer_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/jobs_jobs_influencer_page/jobs_jobs_influencer_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

import 'models/jobs_jobs_influencer_tab_container_model.dart';

// ignore_for_file: must_be_immutable
class JobsJobsInfluencerTabContainerScreen extends StatelessWidget {
  final String? profileImage;

  JobsJobsInfluencerTabContainerScreen({
    Key? key,
    this.profileImage,
    })
      : super(
          key: key,
        );
  JobsJobsInfluencerTabContainerController controller = Get.put(
      JobsJobsInfluencerTabContainerController(
          JobsJobsInfluencerTabContainerModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 
  InfluencerHomeController influencerController =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));
      
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA700,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                         'Jobs'.tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                        AppbarCircleimage(
                              url: (influencerController.updatedProfileImage.value
                                      as String?) ??
                                  influencerController.user.userModelObj.value.avatar,
                              margin: EdgeInsets.only(
                                  left: 20.w, top: 14.h, bottom: 14.h),
                              onTap: () {
                                openDrawer();
                              }
                            ),
                    ]
                    ),
                ),
                Container(
                  height: getVerticalSize(
                    60,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    border: Border(
                      bottom: BorderSide(
                        color: ColorConstant.indigo50,
                        width: getHorizontalSize(
                          1,
                        ),
                      ),
                    ),
                  ),
                  child: TabBar(
                    controller: controller.tabsviewController,
                    labelColor: ColorConstant.cyan100,
                    labelStyle: TextStyle(
                      fontSize: getFontSize(
                        14.5,
                      ),
                      
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    unselectedLabelColor: ColorConstant.gray600,
                    unselectedLabelStyle: TextStyle(
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    
                    indicatorPadding: getPadding(
                      all: 8.0,
                    ),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorConstant.cyan100,
                          width: getHorizontalSize(
                            2,
                          ),
                        ),
                      ),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(
                            "lbl_my_bids".tr,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            "lbl_jobs".tr,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            "lbl_requests2".tr,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(
                    890,
                  ),
                  child: TabBarView(
                    controller: controller.tabsviewController,
                    children: [
                      JobsMyBidsInfluencerPage(),
                      JobsJobsInfluencerPage(),
                      JobsRequestsInfluencerPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: CustomBottomBar(
        //   onChanged: (BottomBarEnum type) {
        //     Get.toNamed(getCurrentRoute(type), id: 1);
        //   },
        // ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.homeCreatorPage;
  //     case BottomBarEnum.Jobs:
  //       return AppRoutes.creatorHireslistTabContainerPage;
  //     case BottomBarEnum.Post:
  //       return AppRoutes.messagesPageInfluencerPage;
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
  //     case AppRoutes.homeCreatorPage:
  //       return HomeCreatorPage();
  //     case AppRoutes.creatorHireslistTabContainerPage:
  //       return CreatorHireslistTabContainerPage();
  //     case AppRoutes.messagesPageInfluencerPage:
  //       return MessagesPageInfluencerPage();
  //     case AppRoutes.messagesPage:
  //       return MessagesPage();
  //     case AppRoutes.communityPage:
  //       return CommunityPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

    openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
