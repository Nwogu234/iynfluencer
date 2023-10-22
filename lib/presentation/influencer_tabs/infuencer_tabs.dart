import '../../widgets/app_bar/influencer_buttom_bar.dart';
import '../community_page/community_page.dart';
import '../influencer_home_one_screen/influencer_home_one_screen.dart';
import '../influencer_home_screen/influencer_home_screen.dart';
import '../jobs_jobs_influencer_tab_container_screen/jobs_jobs_influencer_tab_container_screen.dart';
import '../messages_page/messages_page.dart';
import 'contoller/influencers_tabs_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class InfluencerTabsScreen extends GetWidget<InfluencerTabsController> {
   InfluencerTabsScreen({Key? key}) : super(key: key);
  var currentRoute = AppRoutes.influencerHomeScreen.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(3),
                initialRoute:  controller.currentRoute.value,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(controller.currentRoute.value),
                    transition: Transition.native)),
            bottomNavigationBar:
                InfluencerBottomBar(onChanged: (BottomBarEnum type) {
              controller.currentRoute.value=getCurrentRoute(type);
              Get.toNamed(getCurrentRoute(type), id: 3);
            })));
  }
}

///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Home:
      return AppRoutes.influencerHomeScreen;
    case BottomBarEnum.Job:
      return AppRoutes.jobsJobsInfluencerTabContainerScreen;
    case BottomBarEnum.Chats:
      return AppRoutes.messagesPage;
    case BottomBarEnum.Community:
      return AppRoutes.communityPage;
    default:
      return "/";
  }
}

///Handling page based on route
Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppRoutes.influencerHomeScreen:
      return InfluencerHomeScreen();
    case AppRoutes.jobsJobsInfluencerTabContainerScreen:
      return JobsJobsInfluencerTabContainerScreen();
    case AppRoutes.messagesPage:
      return MessagesPage();
    case AppRoutes.communityPage:
      return CommunityPage();
    default:
      return DefaultWidget();
  }
}
