import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/presentation/all_home_screen.dart/all_home_screen.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/fashion_home_screeen.dart';
import 'package:iynfluencer/presentation/search_creator_screen/search_creator_screen.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/search_influncers_screen.dart';
import 'package:iynfluencer/presentation/social_media_home_screen.dart/social_media_home_page.dart';
import 'package:iynfluencer/presentation/technology_home_screen/binding/controller/model/technology_home_screen.dart';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_1.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../data/general_controllers/user_controller.dart';
import '../../data/models/Influencer/influencer_response_model.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_circleimage.dart';
import '../../widgets/app_bar/appbar_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/skeletons.dart';
import '../creator_profile_draweritem/controller/creator_profile_controller.dart';
import '../creator_profile_draweritem/creator_profile_draweritem.dart';
import '../home_creator_page/widgets/listrectangle50_item_widget.dart';
import '../home_creator_page/widgets/trendinghorizon_item_widget.dart';
import 'controller/home_creator_controller.dart';
import 'models/home_creator_model.dart';
import 'models/listrectangle50_item_model.dart';
import 'models/trendinghorizon_item_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeCreatorPage extends StatefulWidget {
  HomeCreatorPage({Key? key}) : super(key: key);

  @override
  _HomeCreatorPageState createState() => _HomeCreatorPageState();
}

class _HomeCreatorPageState extends State<HomeCreatorPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeCreatorController controller =
      Get.put(HomeCreatorController(HomeCreatorModel().obs));

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
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: false);

    String capitalize(String text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1).toLowerCase();
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        drawer: CreatorProfileDraweritem(),
        appBar: CustomAppBar(
          height: getVerticalSize(70),
          leading: Obx(() {
            if (controller.isLoading.value)
              return Container();
            else {
              String? avatarUrl = controller.user.userModelObj.value.avatar;
              String imageProvider;

              if (avatarUrl != null && avatarUrl.isNotEmpty) {
                imageProvider = avatarUrl;
              } else {
                imageProvider =
                    'https://cdn-icons-png.flaticon.com/512/6915/6915987.png';
              }

              return Align(
                alignment: Alignment.centerLeft,
                child: AppbarCircleimage(
                  // fit: BoxFit.cover,
                  url: imageProvider,
                  margin: EdgeInsets.only(left: 20, top: 16, bottom: 16),
                  onTap: openDrawer,
                  // radius: BorderRadius.circular(getSize(25.r)),
                ),
              );
            }
          }),
          leadingWidth: 60,
          actions: [
            Container(
              child: AppbarSearchview(
                  hintText: "Search influencers".tr,
                  controller: controller.searchController,
                  onTap: () {
                    onTapSubmit();
                  }),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: getPadding(left: 15, top: 10),
                    child: DefaultTextStyle(
                      style: AppStyle.txtSatoshiLight135Gray600.copyWith(
                          fontSize: getFontSize(17),
                          fontWeight: FontWeight.bold),
                      child: Obx(() {
                        if (controller.isLoading.value)
                          return Container();
                        else
                          return AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(milliseconds: 6000),
                            isRepeatingAnimation: true,
                            totalRepeatCount: 3,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Hello ${controller.user.capitalizeFirstLetter(controller.user.userModelObj.value.firstName)},',
                                textStyle: AppStyle.txtSatoshiBold16.copyWith(
                                  fontSize: 16.sp,
                                  color: ColorConstant.black900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                      }),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 15, bottom: 5),
                    child: Text("What do you want to promote?".tr,
                        textAlign: TextAlign.start,
                        style: AppStyle.txtSatoshiMedium),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          tabAlignment: TabAlignment.center,
                          isScrollable: true,
                          controller: _tabController,
                          indicator: BoxDecoration(
                              color: ColorConstant.cyan100,
                              borderRadius: BorderRadius.circular(getSize(20))),
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
                            fontWeight: FontWeight.w500,
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
                                          : (selectedIndex == 0
                                              ? ColorConstant.cyan100
                                              : ColorConstant.gray300B2),
                                      width: isselected
                                          ? 0.0
                                          : (selectedIndex == 1 ? 1.0 : 0.0)),
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
                  Container(
                    height: 600,
                    // Use Expanded to allow TabBarView to take all available space
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        AllHomePage(),
                        FashionHomePage(),
                        TechnologyHomePage(),
                        SocialMediaHomePage()
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  onTapSubmit() {
    print("Search bar tapped");
    Get.to(() => SearchInfluncersScreen());
  }
}
