import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
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

class _HomeCreatorPageState extends State<HomeCreatorPage> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeCreatorController controller = Get.put(HomeCreatorController(HomeCreatorModel().obs));
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
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorConstant.whiteA700,
            drawer: CreatorProfileDraweritem(controller),
            appBar: CustomAppBar(
                height: 63.h,
                leadingWidth: 55.w,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imgGroup899,
                    margin: EdgeInsets.only(left: 20.w, top: 14.h, bottom: 14.h),
                    onTap: () {
                      openDrawer();
                    }),
                title: AppbarSearchview(
                    margin: EdgeInsets.only(left: 14.w),
                    hintText: "msg_search_influncers".tr,
                    controller: controller.searchController),
                styleType: Style.bgOutlineIndigo50),
            body: Obx(
                  () {
                if (controller.isLoading.value) {
                  return CustomLoadingWidget(animationController: animationController,); // Your custom loading widget
                } else if (controller.error.value.isNotEmpty) {
                  return ResponsiveErrorWidget(
                    errorMessage: controller.error.value,
                    onRetry: controller.getUser, // Remove the parentheses
                    fullPage: true,
                  ); // Your error widget
                } else {
                  return Container(
                      width: 1.sw,
                      padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20.w, right: 23.w),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 1.h),
                                            child: Text("lbl_trending".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtSatoshiBold16)),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgForward,
                                            height: 20.h,
                                            width: 20.w,
                                            margin: EdgeInsets.only(bottom: 3.h))
                                      ])),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 133.h,
                                  child: Obx(() => ListView.separated(
                                    padding: EdgeInsets.only(left: 20.w, top: 21.h),
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16.h);
                                    },
                                    itemCount: controller.isTrendLoading.value
                                        ? 5 // Adjust the number of skeleton items as needed
                                        : controller.trendingInfluencers.length,
                                    itemBuilder: (context, index) {
                                      if (controller.isTrendLoading.value) {
                                        return TrendinghorizonItemSkeletonWidget(); // Skeleton widget
                                      } else {
                                        Influencer model = controller.trendingInfluencers[index];
                                        return TrendinghorizonItemWidget(model);
                                      }
                                    },
                                  )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.w, top: 23.h),
                                  child: Text("msg_recommended_influencers".tr,
                                      overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSatoshiBold16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 5.h, right: 20.w),
                                child: Obx(() => ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 24.h);
                                  },
                                  itemCount: controller.isRecommendedLoading.value
                                      ? 5 // Adjust the number of skeleton items as needed
                                      : controller.recommendedInfluencers.length,
                                  itemBuilder: (context, index) {
                                    if (controller.isRecommendedLoading.value) {
                                      return Listrectangle50ItemSkeletonWidget(); // Skeleton widget
                                    } else {
                                      Influencer model = controller.recommendedInfluencers[index];
                                      return Listrectangle50ItemWidget(model);
                                    }
                                  },
                                )),
                              )
                            ]),
                      )); // Your content widget
                }
              },
            ),

            ));
  }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
