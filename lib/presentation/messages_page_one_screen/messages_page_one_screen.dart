import '../messages_page_one_screen/widgets/messages_page1_item_widget.dart';
import 'controller/messages_page_one_controller.dart';
import 'models/messages_page1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage_1.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class MessagesPageOneScreen extends GetWidget<MessagesPageOneController> {
  const MessagesPageOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA70001,
        appBar: CustomAppBar(
          height: getVerticalSize(
            63,
          ),
          leadingWidth: 55,
          leading: AppbarCircleimage1(
            imagePath: ImageConstant.imgEllipse208,
            margin: getMargin(
              left: 20,
              top: 14,
              bottom: 14,
            ),
          ),
          title: AppbarSearchview1(
            margin: getMargin(
              left: 26,
            ),
            hintText: "lbl_search_messages".tr,
            controller: controller.searchController,
          ),
          styleType: Style.bgOutlineIndigo50,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: getVerticalSize(
                        1,
                      ),
                    );
                  },
                  itemCount: controller.messagesPageOneModelObj.value
                      .messagesPage1ItemList.value.length,
                  itemBuilder: (context, index) {
                    MessagesPage1ItemModel model = controller
                        .messagesPageOneModelObj
                        .value
                        .messagesPage1ItemList
                        .value[index];
                    return MessagesPage1ItemWidget(
                      model,
                    );
                  },
                ),
              ),
              Spacer(),
              CustomIconButton(
                height: 54,
                width: 54,
                margin: getMargin(
                  right: 20,
                  bottom: 36,
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgFrameWhiteA700,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type), id: 1);
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeCreatorPage;
      case BottomBarEnum.Jobs:
        return AppRoutes.creatorHireslistTabContainerPage;
      case BottomBarEnum.Post:
        return AppRoutes.messagesPageInfluencerPage;
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
      case AppRoutes.messagesPageInfluencerPage:
        return MessagesPageInfluencerPage();
      case AppRoutes.messagesPage:
        return MessagesPage();
      case AppRoutes.communityPage:
        return CommunityPage();
      default:
        return DefaultWidget();
    }
  }
}
