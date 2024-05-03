import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/listrectangle50_item_widget.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/trendinghorizon_item_widget.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import 'package:iynfluencer/widgets/staggerd_widget.dart';

import '../../data/models/Influencer/influencer_response_model.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({Key? key}) : super(key: key);

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage>
    with SingleTickerProviderStateMixin {
  HomeCreatorController controller =
      Get.put(HomeCreatorController(HomeCreatorModel().obs));

  late AnimationController animationController;
  final ScrollController _scrollController = ScrollController();

  List<Widget> generateTiles(List<Influencer> influencers) {
    return List<Widget>.generate(influencers.length, (index) {
      int crossAxisCellCount = index % 2 == 0 ? 2 : 1;
      return StaggeredGridTile.count(
        crossAxisCellCount: crossAxisCellCount,
        mainAxisCellCount: 1, // Assuming all tiles have the same height
        child: StaggeredWidget(user: influencers[index]),
      );
    });
  }

  void _onScroll() {
    if (!controller.isLoading.value &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      controller.loadRecommendedInfluencers();
    }
  }

  List<Widget> tiles = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    //   controller.loadRecommendedInfluencers(); // Load initial data
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
      if (controller.isLoading.value) {
        return Container(
          height: getHorizontalSize(200),
          child: Stack(
            children: [
              Center(
                child: CustomLoadingWidget(
                  animationController: animationController,
                ),
              ),
            ],
          ),
        );
      } else if (controller.error.value.isNotEmpty) {
        return PositionedDirectional(
          top: 150,
          start: 150,
          child: ResponsiveErrorWidget(
            errorMessage: controller.error.value,
            onRetry: controller.getUser(),
            fullPage: true,
          ),
        );
      } else {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: getPadding(left: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Featured Influencers".tr,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold16
                      .copyWith(
                    fontSize: 16.sp,
                    color: ColorConstant.black900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: controller.tiles,
                  ),
                ),
                Padding(
                  padding: getMargin(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(right: 10, bottom: 7),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Try our new influencers and get up to 25% off your first order.',
                              style: AppStyle.txtSatoshiMedium,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray50.withOpacity(.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Container(
                        height: 225.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.isTrendLoading.value
                              ? 5
                              : controller.trendingInfluencers.length,
                          itemBuilder: (context, index) {
                            if (controller.isTrendLoading.value) {
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: TrendinghorizonItemSkeletonWidget(),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: TrendinghorizonItemWidget(
                                    controller.trendingInfluencers[index]),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(top: 40,left:5),
                      child: Text(
                        'For You',
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold16.copyWith(
                          fontSize: 16.sp,
                          color: ColorConstant.black900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Padding(
                      padding: getPadding(left: 5,bottom: 5,right: 10),
                      child: Text("Based on your activity, we suggest these influencers.".tr,
                          textAlign: TextAlign.start,
                          style: AppStyle.txtSatoshiMedium),
                    ),
                    Divider(height: 0.1,thickness: 0.1,)
                  ],
                ),
                SizedBox(height: 15.h),
                SingleChildScrollView(
                  controller: _scrollController,
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
                                  controller.recommendedInfluencers[index],
                                  

                                  
                                  ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    })));
  }
}
