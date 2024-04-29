import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/messages/chatmodel.dart';
import 'package:iynfluencer/presentation/influencer_home_one_screen/controller/influencer_home_one_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/controller/influencer_home_controller.dart';
import 'package:iynfluencer/presentation/influencer_home_screen/models/influencer_home_model.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import '../messages_page_influencer_page/widgets/listgroup883_item_widget.dart';
import 'controller/messages_page_influencer_controller.dart';
import 'models/messages_page_influencer_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage_1.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_1.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_icon_button.dart';

class MessagesPageInfluencerPage extends StatefulWidget {
  MessagesPageInfluencerPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MessagesPageInfluencerPage> createState() =>
      _MessagesPageInfluencerPageState();
}

class _MessagesPageInfluencerPageState extends State<MessagesPageInfluencerPage>
    with SingleTickerProviderStateMixin {
  MessagesPageInfluencerController controller = Get.put(
      MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));

  InfluencerHomeController influencerController =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BottomBarController bottomBarController = Get.put(BottomBarController());

    InfluencerHomeOneController influencerOneController =
      Get.put(InfluencerHomeOneController());

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

  
  Future<void> _refresh() async {
    await controller.refreshItems();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
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
                                    style: AppStyle.txtSatoshiLight135Gray600
                                        .copyWith(
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
                                      url: (influencerController
                                              .updatedProfileImage
                                              .value as String?) ??
                                          influencerController
                                              .user.userModelObj.value.avatar,
                                      margin: EdgeInsets.only(
                                          left: 20.w, top: 14.h, bottom: 14.h),
                                      onTap: () {
                                        openDrawer();
                                      }),
                                ],
                              )),
                          AppbarSearchview(
                            hintText: "Search Chats".tr,
                            controller: controller.searchController,
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
                                    child:
                                        SizedBox(), // You can replace SizedBox with your loading widget
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
                                    child:
                                        SizedBox(), 
                                  ),
                                ],
                              );
                            }  else {
                               return SizedBox(
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
                                        return Listgroup883ItemWidget(
                                          listgroup883ItemModelObj: model);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                            }
                          })
                        ]))),
          )),
    );
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
 

 /* 
 class MessagesPageInfluencerPage extends StatelessWidget {
  MessagesPageInfluencerPage({Key? key})
      : super(
          key: key,
        );

  MessagesPageInfluencerController controller = Get.put(
      MessagesPageInfluencerController(MessagesPageInfluencerModel().obs));

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
          width: size.width,
          child: SingleChildScrollView(
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
                      itemCount: controller.messagesPageInfluencerModelObj.value
                          .listgroup883ItemList.value.length,
                      itemBuilder: (context, index) {
                        Listgroup883ItemModel model = controller
                            .messagesPageInfluencerModelObj
                            .value
                            .listgroup883ItemList
                            .value[index];
                        return Listgroup883ItemWidget(
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
            ),
          ),
        ),
      ),
    );
  }
}
  */