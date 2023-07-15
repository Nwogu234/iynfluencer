import 'package:iynfluencer/presentation/jobs_my_bids_influencer_page/jobs_my_bids_influencer_page.dart';

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
class JobsJobsInfluencerTabContainerScreen
    extends StatelessWidget{
   JobsJobsInfluencerTabContainerScreen({Key? key})
      : super(
          key: key,
        );
   JobsJobsInfluencerTabContainerController controller =
   Get.put(JobsJobsInfluencerTabContainerController(JobsJobsInfluencerTabContainerModel().obs));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    labelColor: ColorConstant.cyan300,
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
                          color: ColorConstant.cyan300,
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
}
