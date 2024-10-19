import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/controller/fashion_controller.dart';
import 'package:iynfluencer/presentation/fashion_home_screen.dart/model/fashion_home_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/controller/home_creator_controller.dart';
import 'package:iynfluencer/presentation/home_creator_page/models/home_creator_model.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/listrectangle50_item_widget.dart';
import 'package:iynfluencer/presentation/home_creator_page/widgets/trendinghorizon_item_widget.dart';
import 'package:iynfluencer/presentation/messages_page/controller/messages_controller.dart';
import 'package:iynfluencer/presentation/messages_page/models/messages_model.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

class FashionHomePage extends StatefulWidget {
  const FashionHomePage({Key? key}) : super(key: key);

  @override
  State<FashionHomePage> createState() => _FashionHomePageState();
}

class _FashionHomePageState extends State<FashionHomePage>
    with SingleTickerProviderStateMixin {
  // final MessagesController messagesController = Get.find<MessagesController>();
  FashionHomeController controller =
      Get.put(FashionHomeController(FashionHomeModel().obs));

  late AnimationController animationController;

  final MessagesController messagesController =
      Get.put(MessagesController());
  final ScrollController _scrollController = ScrollController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onScroll() {
    if (!controller.isLoading.value &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      //  controller.loadRecommendedInfluencers();
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
    // final messagesController = Get.find<MessagesController>();

    return Scaffold(
       //  key: _scaffoldKey,
        body: Obx(() {
      if (controller.isLoading.value) {
        return CustomLoadingWidget(
          animationController: animationController,
        );
      } else if (controller.error.value.isNotEmpty) {
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
                      height: 229.h,
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
    }));
  }
}
