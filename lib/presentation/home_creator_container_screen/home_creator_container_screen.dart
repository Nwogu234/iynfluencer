import 'package:iynfluencer/presentation/post_page_screen/post_page_screen.dart';

import 'controller/home_creator_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

class HomeCreatorContainerScreen
    extends GetWidget<HomeCreatorContainerController> {
  const HomeCreatorContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homeCreatorPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeCreatorPage;
      case BottomBarEnum.Jobs:
        return AppRoutes.creatorHireslistTabContainerPage;
      case BottomBarEnum.Post:
        return AppRoutes.postPageScreen;
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
      case AppRoutes.homeCreatorPage:
        return HomeCreatorPage();
      case AppRoutes.creatorHireslistTabContainerPage:
        return CreatorHireslistTabContainerPage();
      case AppRoutes.postPageScreen:
        return PostPageScreen();
      case AppRoutes.messagesPage:
        return MessagesPage();
      case AppRoutes.communityPage:
        return CommunityPage();
      default:
        return DefaultWidget();
    }
  }
}
