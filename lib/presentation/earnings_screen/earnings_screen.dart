import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

import '../earnings_screen/widgets/earnings_item_widget.dart';
import 'controller/earnings_controller.dart';
import 'models/earnings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class EarningsScreen extends StatefulWidget {
  EarningsScreen({Key? key}) : super(key: key);

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen>
    with SingleTickerProviderStateMixin {
  final UserController user = Get.find();
   late AnimationController animationController;
  final EarningsController controller = Get.put(EarningsController());

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
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(48),
          leadingWidth: 50,
          leading: AppbarImage(
            height: getSize(30),
            width: getSize(30),
            svgPath: ImageConstant.imgArrowleftGray600,
            margin: getMargin(left: 20, top: 9, bottom: 9),
            onTap: () => onTapArrowleft25(),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_earnings".tr),
          styleType: Style.bgOutlineIndigo50,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: getPadding(top: 40),
            child: Padding(
              padding: getPadding(left: 20, right: 20, bottom: 5),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CustomLoadingWidget(
                      animationController: animationController,
                    ),
                  );
                } else if (controller.error.value.isNotEmpty) {
                  return ResponsiveErrorWidget(
                    errorMessage: controller.error.value,
                    onRetry: () => controller.getUser(),
                    fullPage: true,
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '\$${((user.userModelObj.value.balance) / 100).toString()}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBlack24,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(top: 4),
                          child: Text(
                            "lbl_total_earnings".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight12,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(left: 10, top: 26, right: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: CustomButton(
                                  height: getVerticalSize(42),
                                  text: "lbl_transactions".tr,
                                  margin: getMargin(right: 8),
                                  variant: ButtonVariant.FillGray200ab,
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle:
                                      ButtonFontStyle.SatoshiBold14Gray900,
                                ),
                              ),
                              Flexible(
                                child: CustomButton(
                                  height: getVerticalSize(42),
                                  text: "lbl_withdraw".tr,
                                  margin: getMargin(left: 8),
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle:
                                      ButtonFontStyle.SatoshiBold14Gray100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(left: 2, top: 15),
                        decoration: AppDecoration.outlineIndigo501,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(201),
                                  width: getHorizontalSize(312),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgChartflow,
                                        height: getVerticalSize(165),
                                        width: getHorizontalSize(312),
                                        alignment: Alignment.bottomCenter,
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgChartlines,
                                        height: getVerticalSize(201),
                                        width: getHorizontalSize(311),
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(top: 1),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "lbl_4k".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSatoshiLight12Bluegray600,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(top: 29),
                                          child: Text(
                                            "lbl_3k".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight12Bluegray600,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(top: 28),
                                          child: Text(
                                            "lbl_2k".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight12Bluegray600,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(top: 29),
                                          child: Text(
                                            "lbl_1k".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight12Bluegray600,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              getPadding(top: 29, right: 2),
                                          child: Text(
                                            "lbl_02".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSatoshiLight12Bluegray600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: getPadding(
                                  left: 1, top: 5, right: 40, bottom: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text(
                                      "lbl_jan".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 34, bottom: 1),
                                    child: Text(
                                      "lbl_feb".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 34, bottom: 1),
                                    child: Text(
                                      "lbl_mar".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 34, top: 1),
                                    child: Text(
                                      "lbl_apr".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 34, top: 1),
                                    child: Text(
                                      "lbl_may".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 34, top: 1),
                                    child: Text(
                                      "lbl_jun".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight12Bluegray600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(top: 5),
                              child: Container(
                                height: getVerticalSize(220),
                                child: ListView.builder(
                                  itemCount: controller.isTrendLoading.value
                                      ? 5
                                      : controller.earningsModelObj.value
                                          .earningsItemList.length,
                                  itemBuilder: (context, index) {
                                    Jobz? model = index <
                                            controller.earningsModelObj.value
                                                .earningsItemList.length
                                        ? controller.earningsModelObj.value
                                            .earningsItemList[index]
                                        : null;
                                    return EarningsItemWidget(
                                        earningsItemModelObj: model);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }

  void onTapArrowleft25() {
    Get.back();
  }
}
