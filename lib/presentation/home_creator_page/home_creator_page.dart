import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
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

class HomeCreatorPage extends StatefulWidget {
  HomeCreatorPage({Key? key}) : super(key: key);

  @override
  _HomeCreatorPageState createState() => _HomeCreatorPageState();
}

class _HomeCreatorPageState extends State<HomeCreatorPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeCreatorController controller =
  Get.put(HomeCreatorController(HomeCreatorModel().obs));
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

  @override
  Widget build(BuildContext context) {
    // String? avatarUrl =
    //     controller.user.userModelObj.value.avatar; // Assuming this is a String
    // String imageProvider;
    // print(avatarUrl);
    // if (avatarUrl !='') {
    //   imageProvider = avatarUrl;
    // } else {
    //   imageProvider = "mypic.wit";
    // }

    // Initialize screen_util
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: false);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        drawer: CreatorProfileDraweritem(controller),
        appBar: CustomAppBar(
          height: getSize(63),
          leadingWidth: getSize(55),
          leading: Obx(() => AppbarCircleimage(
            url: controller.avatar.value,
            margin: EdgeInsets.only(left: 20, top: 14, bottom: 14),
            onTap: openDrawer,
          )
          ),
          title: AppbarSearchview(
            margin: EdgeInsets.only(left: 14.w),
            hintText: "msg_search_influncers".tr,
            controller: controller.searchController,
          ),
          styleType: Style.bgOutlineIndigo50,
        ),
        body: Obx(
              () {
            if (controller.isLoading.value) {
              return CustomLoadingWidget(
                animationController: animationController,
              );
            } else if (controller.error.value.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: controller.refreshItems,
                child: ResponsiveErrorWidget(
                  errorMessage: controller.error.value,
                  onRetry: controller.getUser,
                  fullPage: true,
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: controller.refreshItems,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.gray90001
                          ),
                          height: getVerticalSize(200),
                          width: getHorizontalSize(350),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(  // Use Expanded here
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "New Faces, New Deals",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiBold16B.copyWith(fontSize: getFontSize(17)),
                                          ),
                                          SizedBox(height: getVerticalSize(5)),
                                          Text(
                                            "Explore fresh talent ready to boost your brand, offering special discounts",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSatoshiBold16B.copyWith(fontSize: getFontSize(12)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgForward,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getVerticalSize(20)),
                              Container(
                                height: getVerticalSize(100),
                                width: getVerticalSize(400),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: getPadding(left: 10,right: 10),
                                  itemCount: controller.isTrendLoading.value
                                      ? 5
                                      : controller.trendingInfluencers.length,
                                  itemBuilder: (context, index) {
                                    if (controller.isTrendLoading.value) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: TrendinghorizonItemSkeletonWidget(),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: TrendinghorizonItemWidget(controller.trendingInfluencers[index]),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 23.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "msg_recommended_influencers".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16.copyWith(fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              for (var index = 0;
                              index <
                                  (controller.isRecommendedLoading.value
                                      ? 5
                                      : controller.recommendedInfluencers.length);
                              index++)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 24.h),
                                  child: controller.isRecommendedLoading.value
                                      ? Listrectangle50ItemSkeletonWidget()
                                      : Listrectangle50ItemWidget(
                                      controller.recommendedInfluencers[index]),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
