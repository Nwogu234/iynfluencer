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
import 'package:iynfluencer/presentation/social_media_home_screen.dart/controller/social_media_controller.dart';
import 'package:iynfluencer/presentation/social_media_home_screen.dart/model/social_media_home_model.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

class SocialMediaHomePage extends StatefulWidget {
  const SocialMediaHomePage({Key? key}) : super(key: key);

  @override
  State<SocialMediaHomePage> createState() => _SocialMediaHomePageState();
}

class _SocialMediaHomePageState extends State<SocialMediaHomePage>
    with SingleTickerProviderStateMixin {

 SocialMediaHomeController controller =
      Get.put(SocialMediaHomeController(SocialMediaHomeModel().obs));

  late AnimationController animationController;
  final ScrollController _scrollController = ScrollController();


void _onScroll() {
  if (!controller.isLoading.value &&
      _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
   // controller.loadRecommendedInfluencers();
  }
}

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
     return SafeArea(
      child: Scaffold(
      body: Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: Stack(
            children: [
             Positioned(
                top: 150,
                left:150,
               child: CustomLoadingWidget(
                animationController: animationController,
                       ),
             ),
            ],
          ),
        );
      } else if (controller.error.value.isEmpty) {
        return ResponsiveErrorWidget(
          errorMessage: controller.error.value,
          onRetry: controller.getUser,
          fullPage: true,
        );
      } else {
        return SingleChildScrollView(
          controller: _scrollController,
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
                          Column(
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
              ],
            ),
            ),
        );
      }
    })));
  }
}
