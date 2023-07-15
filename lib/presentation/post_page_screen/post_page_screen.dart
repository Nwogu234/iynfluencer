import 'controller/post_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';
import 'package:iynfluencer/presentation/creator_hireslist_tab_container_page/creator_hireslist_tab_container_page.dart';
import 'package:iynfluencer/presentation/home_creator_page/home_creator_page.dart';
import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/presentation/messages_page_influencer_page/messages_page_influencer_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_button.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

import 'models/post_page_model.dart';

// ignore_for_file: must_be_immutable
class PostPageScreen extends StatelessWidget {

   PostPageScreen({Key? key})
      : super(
          key: key,
        );
  PostPageController controller = Get.put(PostPageController(PostPageModel().obs));
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            57,
          ),
          leadingWidth: 44,
          leading: AppbarImage(
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgArrowright,
            margin: getMargin(
              left: 20,
              top: 17,
              bottom: 16,
            ),
          ),
          actions: [
            AppbarButton(
              margin: getMargin(
                left: 21,
                top: 13,
                right: 21,
                bottom: 12,
              ),
            ),
          ],
          styleType: Style.bgShadowGray9000c,
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 35,
            ),
            child: Padding(
              padding: getPadding(
                left: 20,
                right: 19,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    width: getHorizontalSize(
                      216,
                    ),
                    focusNode: FocusNode(),
                    autofocus: true,
                    controller: controller.inputController,
                    hintText: "msg_what_is_the_job".tr,
                    margin: getMargin(
                      left: 1,
                    ),
                    variant: TextFormFieldVariant.None,
                    fontStyle: TextFormFieldFontStyle.SatoshiBold22,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        top: 23,
                      ),
                      padding: getPadding(
                        left: 28,
                        top: 33,
                        right: 28,
                        bottom: 33,
                      ),
                      decoration: AppDecoration.outlineGray20002.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder7,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(
                              236,
                            ),
                            margin: getMargin(
                              left: 22,
                              top: 1,
                              right: 20,
                            ),
                            child: Text(
                              "msg_upload_media_files".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtSatoshiLight13,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              43,
                            ),
                            text: "lbl_select_media".tr,
                            margin: getMargin(
                              top: 13,
                            ),
                            variant: ButtonVariant.OutlineGray300b2,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.SatoshiLight14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_job_category".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13Gray900,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: controller.frametwelveController,
                          hintText: "msg_eg_comedy_arts".tr,
                          margin: getMargin(
                            top: 6,
                          ),
                          padding: TextFormFieldPadding.PaddingT14,
                          suffix: Container(
                            margin: getMargin(
                              left: 30,
                              top: 14,
                              right: 13,
                              bottom: 14,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdownGray600,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: getVerticalSize(
                              48,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 29,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "msg_what_is_your_budget".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13Gray900,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: getPadding(
                                    right: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_from".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight13Gray900,
                                      ),
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          160,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: controller.priceController,
                                        hintText: "lbl_50".tr,
                                        margin: getMargin(
                                          top: 7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_to".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtSatoshiLight13Gray900,
                                      ),
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          160,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller:
                                            controller.priceoneController,
                                        hintText: "lbl_2002".tr,
                                        margin: getMargin(
                                          top: 7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 29,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_add_description".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13Gray900,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: controller.frametwelveoneController,
                          hintText: "msg_explain_briefly".tr,
                          margin: getMargin(
                            top: 6,
                          ),
                          padding: TextFormFieldPadding.PaddingT38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 29,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "msg_add_responsibilities".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight13Gray900,
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: controller.frametwelvetwoController,
                          hintText: "msg_input_all_milestones".tr,
                          margin: getMargin(
                            top: 6,
                          ),
                          padding: TextFormFieldPadding.PaddingT38,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}

//   ///Handling route based on bottom click actions
//   String getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Home:
//         return AppRoutes.homeCreatorPage;
//       case BottomBarEnum.Jobs:
//         return AppRoutes.creatorHireslistTabContainerPage;
//       case BottomBarEnum.Post:
//         return AppRoutes.messagesPageInfluencerPage;
//       case BottomBarEnum.Chats:
//         return AppRoutes.messagesPage;
//       case BottomBarEnum.Community:
//         return AppRoutes.communityPage;
//       default:
//         return "/";
//     }
//   }
//
//   ///Handling page based on route
//   Widget getCurrentPage(String currentRoute) {
//     switch (currentRoute) {
//       case AppRoutes.homeCreatorPage:
//         return HomeCreatorPage();
//       case AppRoutes.creatorHireslistTabContainerPage:
//         return CreatorHireslistTabContainerPage();
//       case AppRoutes.messagesPageInfluencerPage:
//         return MessagesPageInfluencerPage();
//       case AppRoutes.messagesPage:
//         return MessagesPage();
//       case AppRoutes.communityPage:
//         return CommunityPage();
//       default:
//         return DefaultWidget();
//     }
//   }

