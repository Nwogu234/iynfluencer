import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/presentation/search_creator_screen/search_creator_screen.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

import '../messages_page/widgets/messages_page_item_widget.dart';
import 'controller/messages_controller.dart';
import 'models/messages_model.dart';
import 'models/messages_page_item_model.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with SingleTickerProviderStateMixin {
  final MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeCreatorController homeController =
      Get.put(HomeCreatorController(HomeCreatorModel().obs));

  BottomBarController bottomBarController = Get.put(BottomBarController());

  late AnimationController animationController;
  HomeCreatorContainerController homeContainerController =
      Get.put(HomeCreatorContainerController());

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

  Future<void> _refresh() async {
    await controller.refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillWhiteA700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultTextStyle(
                          style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(milliseconds: 6000),
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
                      ],
                    ),
                  ),
                  AppbarSearchview(
                    hintText: "Search Chats".tr,
                    controller: controller.searchController,
                    onSubmitted: (query) async {
                      Get.to(() => SearchCreatorScreen(
                            query: query,
                            trendingInfluencers:
                                homeController.trendingInfluencers,
                          ));
                    },
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Obx(() {
                    if (controller.isTrendLoading.value) {
                       return Stack(
                        children: [
                         CustomLoadingWidget(
                          animationController: animationController,
                             ),
                          PositionedDirectional(
                           bottom: 100,
                           start: 150,
                           child: SizedBox(), // You can replace SizedBox with your loading widget
                          ),
                         ],
                       );
                    } else if (controller.error.value.isNotEmpty) {
                     return Stack(
                     children: [
                      ResponsiveErrorWidget(
                        errorMessage: controller.error.value,
                        onRetry: () {
                         controller.getUser();
                        },
                      fullPage: true,
                      ),
                     PositionedDirectional(
                      top: 150,
                      start: 150,
                     child: SizedBox(), // You can replace SizedBox with your error widget
                    ),
                  ],
                  );
                    } else if (controller.chatModelObj.isEmpty) {
                      return ResponsiveEmptyWidget(
                        errorMessage:
                            'You don\'s have Influencers in your chats',
                        buttonText: "Go to HomePage",
                        onRetry: () {
                          homeContainerController.currentRoute.value =
                              AppRoutes.homeCreatorPage;
                          Navigator.of(Get.nestedKey(1)!.currentState!.context)
                              .pushReplacementNamed(AppRoutes.homeCreatorPage);
                          bottomBarController.selectedIndex.value = 3;
                        },
                        fullPage: true,
                      );
                    } else {
                      return SizedBox(
                        width: size.width,
                        height: MediaQuery.of(context).size.height,
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
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                    );
                                  },
                                  itemCount: controller.isTrendLoading.value
                                      ? 5
                                      : controller.chatList.length,
                                  itemBuilder: (context, index) {
                                    if (controller.isTrendLoading.value) {
                                      return BidsListWidgetSkeleton();
                                    } else {
                                      ChatData model =
                                          controller.chatList[index];
                                      return MessagesPageItemWidget(
                                        messagesPageItemModelObj: model);
                                    }
                                  },
                                ),
                              ),
                           /*    CustomIconButton(
                                height: 54,
                                width: 54,
                                margin: getMargin(
                                  top: 183,
                                  right: 20,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgFrameWhiteA700,
                                ),
                              ), */
                            ],
                          ),
                        ),
                      );
                    }
                  }),
                ],
              ),
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
