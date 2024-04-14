import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/models/search_influncers_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/controller/search_results_controller.dart';
import 'package:iynfluencer/presentation/search_results_screen/search_results_screen.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import '../search_influncers_screen/widgets/trending_item_widget.dart';
import 'controller/search_influncers_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_searchview_2.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';

class SearchInfluncersScreen extends StatefulWidget {
  SearchInfluncersScreen({Key? key}) : super(key: key);

  @override
  State<SearchInfluncersScreen> createState() => _SearchInfluncersScreenState();
}

class _SearchInfluncersScreenState extends State<SearchInfluncersScreen>
    with SingleTickerProviderStateMixin {
  SearchInfluncersController controller =
      Get.put(SearchInfluncersController(SearchInfluncersModel().obs));

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
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getSize(63),
                leadingWidth: getSize(55),
                leading: AppbarImage(
                    height: getSize(30),
                    width: getSize(30),
                    svgPath: ImageConstant.imgArrowleftGray600,
                    margin: getMargin(left: 15, top: 15, bottom: 15),
                    onTap: () {
                      onTapArrowleft5();
                    }),
                title: AppbarSearchview2(
                    onTap: (query) async {
                      onTapSubmit(query);
                    },
                    margin: getMargin(left: 9),
                    hintText: "msg_search_influncers".tr,
                    controller: controller.searchController),
                styleType: Style.bgOutlineIndigo50),
            body: RefreshIndicator(
              onRefresh: _refresh,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return CustomLoadingWidget(
                    animationController: animationController,
                  );
                } else if (controller.error.value.isNotEmpty) {
                  return ResponsiveErrorWidget(
                    errorMessage: controller.error.value,
                    onRetry: controller.getUser,
                    fullPage: true,
                  );
                } else {
                  return Container(
                      width: double.maxFinite,
                      padding: getPadding(top: 16, bottom: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(left: 28, right: 22),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("lbl_recent".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSatoshiBold14Gray600),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgFrameGray60020x20,
                                              height: getSize(20),
                                              width: getSize(20))
                                        ]))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 130,
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.only(left: 20.w),
                                      itemCount: controller.isTrendLoading.value
                                          ? 5
                                          : controller
                                              .trendingInfluencers.length,
                                      itemBuilder: (context, index) {
                                        if (controller.isTrendLoading.value) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 16.w),
                                            child:
                                                TrendinghorizonItemSkeletonWidget(),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 7.w),
                                            child: TrendingItemWidget(controller
                                                .trendingInfluencers[index]),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: getPadding(left: 28),
                                child: Text("msg_frequent_searches".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSatoshiBold14Gray600)),
                            Padding(
                                padding: getPadding(left: 28, top: 14),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgSearchGray600,
                                      height: getSize(13),
                                      width: getSize(13),
                                      margin: getMargin(bottom: 4)),
                                  Padding(
                                    padding: getPadding(left: 8),
                                    child: Text("msg_influencer_with".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15)),
                                  )
                                ])),
                            Padding(
                                padding: getPadding(left: 28, top: 16),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgSearchGray600,
                                      height: getSize(13),
                                      width: getSize(13),
                                      margin: getMargin(top: 2, bottom: 2)),
                                  Padding(
                                    padding: getPadding(left: 8),
                                    child: Text(
                                        "msg_intermediate_influencers".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15)),
                                  )
                                ])),
                            Padding(
                                padding: getPadding(left: 28, top: 19),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgSearchGray600,
                                      height: getSize(13),
                                      width: getSize(13),
                                      margin: getMargin(bottom: 4)),
                                  Padding(
                                    padding: getPadding(left: 8),
                                    child: Text("lbl_top_influencers".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15.sp)),
                                  )
                                ])),
                            Padding(
                                padding:
                                    getPadding(left: 28, top: 16, bottom: 5),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgSearchGray600,
                                      height: getSize(13),
                                      width: getSize(13),
                                      margin: getMargin(top: 2, bottom: 2)),
                                  Padding(
                                    padding: getPadding(left: 8),
                                    child: Text("msg_india_influencers".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold16
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15)),
                                  )
                                ]))
                          ]));
                }
              }),
            )));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft5() {
    Get.back();
  }

  /* onTapSubmit(String query) {
    Get.to(() => SearchResultsScreen(query:query));
    final searchController = Get.find<SearchResultsController>().searchController;
        Get.find<SearchResultsController>().filterInfluencers(searchController.text);
  } */
    void onTapSubmit(String query) {
    Get.toNamed(AppRoutes.searchResultsScreen);
    Get.find<SearchResultsController>().filterInfluencers(query);
  }

}
