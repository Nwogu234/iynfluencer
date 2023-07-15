import '../community_influncer_screen/widgets/body1_item_widget.dart';
import 'controller/community_influncer_controller.dart';
import 'models/body1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class CommunityInfluncerScreen extends GetWidget<CommunityInfluncerController> {
  const CommunityInfluncerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getHorizontalSize(
                  343,
                ),
                margin: getMargin(
                  left: 16,
                  top: 8,
                  right: 16,
                ),
                padding: getPadding(
                  top: 15,
                  bottom: 15,
                ),
                decoration: AppDecoration.outlineGray9000c.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAppBar(
                      height: getVerticalSize(
                        41,
                      ),
                      leadingWidth: 71,
                      leading: AppbarCircleimage(
                        imagePath: ImageConstant.imgGroup85243,
                        margin: getMargin(
                          left: 31,
                        ),
                      ),
                      title: AppbarSubtitle1(
                        text: "lbl_micheal_scott".tr,
                        margin: getMargin(
                          left: 12,
                        ),
                      ),
                      actions: [
                        AppbarImage(
                          height: getVerticalSize(
                            1,
                          ),
                          width: getHorizontalSize(
                            13,
                          ),
                          svgPath: ImageConstant.imgVector,
                          margin: getMargin(
                            left: 32,
                            top: 19,
                            right: 32,
                            bottom: 19,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        left: 15,
                        top: 12,
                      ),
                      child: Text(
                        "msg_write_your_caption".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight15,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle5068,
                      height: getVerticalSize(
                        211,
                      ),
                      width: getHorizontalSize(
                        343,
                      ),
                      margin: getMargin(
                        top: 11,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 14,
                          top: 12,
                          right: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgThumbupoutline,
                              height: getSize(
                                18,
                              ),
                              width: getSize(
                                18,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 4,
                                top: 1,
                              ),
                              child: Text(
                                "lbl_102".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold12,
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgLightbulb,
                              height: getSize(
                                18,
                              ),
                              width: getSize(
                                18,
                              ),
                              margin: getMargin(
                                left: 16,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 4,
                                top: 1,
                              ),
                              child: Text(
                                "lbl_20".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold12,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              svgPath: ImageConstant.imgBookmark,
                              height: getSize(
                                18,
                              ),
                              width: getSize(
                                18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 22,
                  ),
                  child: Padding(
                    padding: getPadding(
                      left: 16,
                      right: 16,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
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
                        itemCount: controller.communityInfluncerModelObj.value
                            .body1ItemList.value.length,
                        itemBuilder: (context, index) {
                          Body1ItemModel model = controller
                              .communityInfluncerModelObj
                              .value
                              .body1ItemList
                              .value[index];
                          return Body1ItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
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
