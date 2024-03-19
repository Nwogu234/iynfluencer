import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class TechnologyHomePage extends StatefulWidget {
  const TechnologyHomePage({Key? key}) : super(key: key);

  @override
  State<TechnologyHomePage> createState() => _TechnologyHomePageState();
}

class _TechnologyHomePageState extends State<TechnologyHomePage>
    with SingleTickerProviderStateMixin {
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
    return SafeArea(child: Scaffold(body: Obx(() {
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
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                            Text(
                              'View All'.tr,
                              textAlign: TextAlign.right,
                             style: AppStyle.txtSatoshiBold16.copyWith(
                                color:ColorConstant.cyan100,
                             ),
                            )
                          ],
                        ),
                        Padding(
                          padding: getMargin(top: 20),
                            child: SingleChildScrollView(
                              child: Container(
                                height: 150.h,
                                child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                    itemCount: controller.isTrendLoading.value
                                          ? 5
                                          : controller
                                              .trendingInfluencers.length,
                                      itemBuilder: (context, index) {
                                        if (controller.isTrendLoading.value) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child:
                                                TrendinghorizonItemSkeletonWidget(),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: TrendinghorizonItemWidget(
                                                controller.trendingInfluencers[
                                                    index]),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        Padding(
                          padding: getPadding(top:20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Best Match',
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: ColorConstant.black900,
                                    fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                 'View All'.tr,
                              textAlign: TextAlign.right,
                               style: AppStyle.txtSatoshiBold16.copyWith(
                                color:ColorConstant.cyan100,
                             ),
                            ),     
                            ],
                          ),
                        ),
                        
                          SizedBox(height: 15.h),
                          SingleChildScrollView(
                            child: Container(
                             height:double.maxFinite,
                             width: double.infinity,
                              child: Column(
                                 children: [
                               for (var index = 0;
                                   index <
                                       (controller.isRecommendedLoading.value
                                           ? 5
                                           : controller
                                               .recommendedInfluencers.length);
                                   index++)
                                 Padding(
                                   padding: EdgeInsets.only(bottom: 24.h),
                                   child: controller.isRecommendedLoading.value
                                       ? Listrectangle50ItemSkeletonWidget()
                                       : Listrectangle50ItemWidget(controller
                                           .recommendedInfluencers[index]),
                                 ),
                                  ],
                               ),
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
