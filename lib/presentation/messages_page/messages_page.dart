import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/presentation/search_creator_screen/search_creator_screen.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';

import '../messages_page/widgets/messages_page_item_widget.dart';
import 'controller/messages_controller.dart';
import 'models/messages_model.dart';
import 'models/messages_page_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage_1.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({Key? key})
      : super(
          key: key,
        );

  MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    HomeCreatorController homeController =
      Get.put(HomeCreatorController(HomeCreatorModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         DefaultTextStyle(                              
                            style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold
                            ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause:Duration(milliseconds: 6000),
                          isRepeatingAnimation: true,
                          totalRepeatCount: 3,
                           animatedTexts: [
                             TypewriterAnimatedText('Messages'),
                                    ],
                               ),
                            ),       
                          AppbarCircleimage(
                             url: homeController.user.userModelObj.value.avatar,
                             margin:
                                    EdgeInsets.only(left: 20, top: 14, bottom: 14),
                                onTap: openDrawer,
                              ),
                      ]
                      ),
                  ),
               AppbarSearchview(
                  hintText: "Search Chats".tr,
                  controller: controller.searchController,
                  onSubmitted: (query) async {
                     Get.to(() => SearchCreatorScreen(
                                query: query,
                                trendingInfluencers: homeController.trendingInfluencers,
                              ));
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                  SizedBox(
                    width: size.width,
                    height: getVerticalSize(800),
                     child: Padding(
                      padding: getPadding(
                     bottom: 5,
                     ),
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
                      itemCount: controller.messagesModelObj.value
                          .messagesPageItemList.value.length,
                      itemBuilder: (context, index) {
                        MessagesPageItemModel model = controller
                            .messagesModelObj
                            .value
                            .messagesPageItemList
                            .value[index];
                        return MessagesPageItemWidget(
                          model,
                        );
                      },
                      ),
                    ),
                    CustomIconButton(
                      height: 54,
                      width: 54,
                      margin: getMargin(
                       top: 183,
                       right: 20,
                         ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFrameWhiteA700,
                           ),
                        ),
                       ],
                   ),
                 ))   
              ],
            ),
          ),
        ),
      ),
    );
  }

    openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
