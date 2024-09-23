import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/presentation/earning_menu_tab/controller/earning_tab_controller.dart';
import 'package:iynfluencer/presentation/earnings_screen/widgets/earnings_item_widget.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

class EarningMenuTabScreen extends StatefulWidget {
  const EarningMenuTabScreen({Key? key}) : super(key: key);

  @override
  State<EarningMenuTabScreen> createState() => _EarningMenuTabScreenState();
}

class _EarningMenuTabScreenState extends State<EarningMenuTabScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final EarningsTabController controller = Get.put(EarningsTabController());

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  
  Future<void> _refresh() async {
    await controller.refreshItems();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(48),
        leadingWidth: 50,
        leading: AppbarImage(
          height: getSize(30),
          width: getSize(30),
          svgPath: ImageConstant.imgArrowleftGray600,
          margin: getMargin(left: 20, top: 6, bottom: 12),
          onTap: () {
            onTapArrowleft12();
          },
        ),
        centerTitle: true,
        title: AppbarTitle(text: "Earnings".tr),
        styleType: Style.bgOutlineIndigo50,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CustomLoadingWidget(
                animationController: animationController,
              ),
            );
          } else if (controller.error.value.isNotEmpty) {
            return Center(
              child: Padding(
                 padding: const EdgeInsets.only(
                    left: 30,
                    right: 20,
                    top:200
              ),
                child: ResponsiveErrorWidget(
                  errorMessage: controller.error.value,
                  onRetry: () {
                    controller.getUser();
                  },
                  fullPage: true,
                ),
              ),
            );
          } else if (controller.existingJobs.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top:200
              ),
              child: ResponsiveEmptyWidget(
                  errorMessage: 'No Earnings found',
                  smallMessage: 'Your Earnings will appear here',
                  buttonText: "Ooops",
                  onRetry: () {}),
            );
          } else {
            return Padding(
              padding: getPadding(top: 5),
              child: Container(
                height: getVerticalSize(220),
                child: ListView.builder(
                  itemCount: controller.isTrendLoading.value
                      ? 5
                      : controller
                          .earningsModelObj.value.earningsItemList.length,
                  itemBuilder: (context, index) {
                    Jobz? model = index <
                            controller.earningsModelObj.value.earningsItemList
                                .length
                        ? controller
                            .earningsModelObj.value.earningsItemList[index]
                        : null;
                    return EarningsItemWidget(earningsItemModelObj: model);
                  },
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  void onTapArrowleft12() {
    Get.back();
  }
}
