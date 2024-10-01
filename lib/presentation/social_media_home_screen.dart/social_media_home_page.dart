import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/listrectangle50_item_widget.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/trendinghorizon_item_widget.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SocialMediaHomeController controller =
      Get.put(SocialMediaHomeController(SocialMediaHomeModel().obs));

  late AnimationController animationController;
  final MessagesController messagesController =
      Get.put(MessagesController(MessagesModel().obs));
  // final MessagesController messagesController = Get.find<MessagesController>();
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
   // messagesController.dispose();
  }

  @override
  void dispose() {
    animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        // key: _scaffoldKey,
        body: Obx(() {
      if (controller.isLoading.value) {
        return CustomLoadingWidget(
          animationController: animationController,
        );
      }
      if (!controller.error.value.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 120,
          ),
          child: ResponsiveErrorWidget(
            errorMessage: controller.error.value,
            onRetry: controller.getUser,
            fullPage: true,
          ),
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
                      style: AppStyle.txtSatoshiBold16.copyWith(
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
                      height: 200.h,
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
                              child: Animate(
                                 effects:[MoveEffect(duration: Duration(seconds:1)),FadeEffect(duration: Duration(seconds:1))],
                                child: TrendinghorizonItemWidget(
                                    controller.trendingInfluencers[index],
                                    index < messagesController.chatList.length
                                          ? messagesController.chatList[index]
                                          : null,
                                    ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'For You',
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold16.copyWith(
                          fontSize: 16.sp,
                          color: ColorConstant.black900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All'.tr,
                        textAlign: TextAlign.right,
                        style: AppStyle.txtSatoshiBold16.copyWith(
                          color: ColorConstant.cyan100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:50),
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
                                : Animate(
                                   effects:[MoveEffect(duration: Duration(seconds:1)),FadeEffect(duration: Duration(seconds:1))],
                                  child: Listrectangle50ItemWidget(
                                      controller.recommendedInfluencers[index],
                                      index < messagesController.chatList.length
                                          ? messagesController.chatList[index]
                                          : null,
                                    ),
                                ),
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
