import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'controller/creator_hireslist_tab_container_controller.dart';
import 'models/creator_hireslist_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/creator_hireslist_page/creator_hireslist_page.dart';
import 'package:iynfluencer/presentation/creator_jobslist_page/creator_jobslist_page.dart';

class CreatorHireslistTabContainerPage extends StatelessWidget {
  CreatorHireslistTabContainerPage({Key? key})
      : super(
          key: key,
        );

  CreatorHireslistTabContainerController controller = Get.put(
      CreatorHireslistTabContainerController(
          CreatorHireslistTabContainerModel().obs));

          
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeCreatorController homeController =
      Get.put(HomeCreatorController(HomeCreatorModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key:_scaffoldKey,
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
                       DefaultTextStyle(                              
                                 style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
                                  child: AnimatedTextKit(
                                     repeatForever: true,
                                     pause:Duration(milliseconds: 6000),
                                     isRepeatingAnimation: true,
                                     totalRepeatCount: 3,
                                     animatedTexts: [
                                       TypewriterAnimatedText('Jobs'),
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
                    controller: controller.tabiewController,
                    labelColor: ColorConstant.cyan100,
                    labelStyle: TextStyle(
                      fontSize: getFontSize(
                        14.5,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    unselectedLabelColor: ColorConstant.gray500,
                    unselectedLabelStyle: TextStyle(
                      fontSize: getFontSize(
                        14.5,
                      ),
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w300,
                    ),
                    indicatorColor: ColorConstant.cyan100,
                    tabs: [
                      Tab(
                        child: Text(
                          "lbl_my_posting".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "lbl_hires2".tr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(
                    620,
                  ),
                  child: TabBarView(
                    controller: controller.tabiewController,
                    children: [
                      CreatorJobslistPage(),
                      CreatorHireslistPage(),
                    ],
                  ),
                ),
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
