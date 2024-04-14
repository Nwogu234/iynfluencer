import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/all_influencer_home_screen.dart/all_influencer_home_screen.dart';
import 'package:iynfluencer/presentation/influencer_drawer_item/controller/influencer_drawer_controller.dart';
import 'package:iynfluencer/presentation/influencer_fashion_home_screen/influencer_fashion_home_screen.dart';
import 'package:iynfluencer/presentation/influencer_social_media_home_screen/influencer_social_media_home_screen.dart';
import 'package:iynfluencer/presentation/influencer_technology_home_screen/influencer_technology_home_screen.dart';
import 'package:iynfluencer/presentation/job_details_screen/job_details_screen.dart';
import 'package:iynfluencer/presentation/technology_home_screen/binding/controller/model/technology_home_screen.dart';
import 'package:iynfluencer/widgets/app_bar/influencer_buttom_bar.dart';

import '../../data/models/Jobs/job_model.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/skeletons.dart';
import '../influencer_drawer_item/influencer_drawer.dart';
import '../influencer_home_screen/widgets/influencer_home_item_widget.dart';
import '../jobs_jobs_influencer_tab_container_screen/jobs_jobs_influencer_tab_container_screen.dart';
import 'controller/influencer_home_controller.dart';
import 'models/influencer_home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/community_page/community_page.dart';

import 'package:iynfluencer/presentation/messages_page/messages_page.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_circleimage.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

import 'models/influencer_home_model.dart';

class InfluencerHomeScreen extends StatefulWidget {
  final String? profileImage;

  InfluencerHomeScreen({
    Key? key,
    this.profileImage,
  }) : super(key: key);

  @override
  _InfluencerHomeScreenState createState() => _InfluencerHomeScreenState();
}

class _InfluencerHomeScreenState extends State<InfluencerHomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{

       @override
  bool get wantKeepAlive => true;

  InfluencerHomeController controller =
      Get.put(InfluencerHomeController(InfluencerHomeModel().obs));
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController animationController;

  late TabController _tabController;
   bool isselected = false;
   int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _tabController = TabController(length: 4, vsync: this);
  }


  @override
  void dispose() {
    animationController.dispose();
    _tabController.dispose();
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
      drawer: InfluencerDraweritem(
        controller: controller,
      ),
      backgroundColor: ColorConstant.whiteA70001,
      body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Home'.tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          AppbarCircleimage(
                              url: (controller.updatedProfileImage.value
                                      as String?) ??
                                  controller.user.userModelObj.value.avatar,
                              margin: EdgeInsets.only(
                                  left: 20.w, top: 14.h, bottom: 14.h),
                              onTap: () {
                                openDrawer();
                              }),
                        ]),
                  ),
                  AppbarSearchview(
                      margin: getMargin(left: 5),
                      hintText: "msg_search_creators".tr,
                      controller: controller.searchController2,
                      onSubmitted: (query) {
                        controller.onSearchSubmitted(query);
                      }),
                       SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            controller: _tabController,
                            indicator: BoxDecoration(
                                color: ColorConstant.cyan100,
                                borderRadius: BorderRadius.circular(20)),
                                indicatorPadding: EdgeInsets.symmetric(vertical: 7),
                            labelColor: ColorConstant.whiteA700,
                            labelStyle: TextStyle(
                              fontSize: getFontSize(
                                14.5,
                              ),
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w800,
                            ),
                            unselectedLabelColor: ColorConstant.black900,
                            unselectedLabelStyle: TextStyle(
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w600,
                            ),
                            onTap: (bool) {
                              setState(() {
                                isselected = true;
                              });
                            },
                            tabs: [
                              Tab(
                                  child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                         color: isselected
                                            ? ColorConstant.cyan100
                                            : (selectedIndex == 0 ? ColorConstant.cyan100 :ColorConstant.gray300B2),
                                          width: isselected ? 0.0 : (selectedIndex == 1 ? 3.0 : 0.0)
                                        ),
                                  borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 2),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'All'.tr,
                                      //    overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              )),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isselected
                                            ? ColorConstant.cyan100
                                            : ColorConstant.gray300B2,
                                        width: isselected ? 0.0 : 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 5),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Fashion".tr,
                                        //    overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                           color: isselected
                                            ? ColorConstant.cyan100
                                            : ColorConstant.gray300B2,
                                        width: isselected ? 0.0 : 3.0,
                                          ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 5),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Technologies".tr,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: isselected
                                            ? ColorConstant.cyan100
                                            : ColorConstant.gray300B2,
                                        width: isselected ? 0.0 : 3.0,
                                         ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 5),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Social Media".tr,
                                        //  overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(890),
                      child: TabBarView(
                        controller: _tabController, 
                        children: [
                        AllInfluencerHomePage(),
                        InfluencerFashionHomePage(),
                        InfluencerTechnologyHomePage(),
                        InfluencerSocialMediaHomePage()
                      ]),
                    )
                ]),
          )),
    ));
  }

  // ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.influencerHomeScreen;
  //     case BottomBarEnum.Jobs:
  //       return AppRoutes.jobsJobsInfluencerPage;
  //
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
  //     case AppRoutes.influencerHomeScreen:
  //       return InfluencerHomeScreen();
  //     case AppRoutes.jobsJobsInfluencerTabContainerScreen:
  //       return JobsJobsInfluencerTabContainerScreen();
  //
  //     case AppRoutes.messagesPage:
  //       return MessagesPage();
  //     case AppRoutes.communityPage:
  //       return CommunityPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  /// Navigates to the jobDetailsScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the jobDetailsScreen.
  onTapJobpost(model) {
    Get.to(JobDetailsScreen(
      selectedJob: model,
    ));
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}

