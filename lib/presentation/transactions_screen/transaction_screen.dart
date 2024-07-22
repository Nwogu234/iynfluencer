import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/payments/payment_model.dart';
import 'package:iynfluencer/presentation/transaction_one_screen/controller/transaction_one_controller.dart';
import 'package:iynfluencer/presentation/transaction_one_screen/transaction_one_screen.dart';
import 'package:iynfluencer/presentation/transactions_screen/controller/transaction_controller.dart';
import 'package:iynfluencer/presentation/transactions_screen/widget/transaction_widget.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(TransactionController());
  late AnimationController animationController;
  final scrollController = ScrollController();

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
                margin: getMargin(left: 20, top: 6, bottom: 12),
                onTap: () {
                  onTapArrowleft12();
                },
              ),
              centerTitle: true,
              title: AppbarTitle(text: "Transactions".tr),
              styleType: Style.bgOutlineIndigo50,
            ),
            body: RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                width: double.maxFinite,
                padding: getPadding(top: 14, bottom: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: getPadding(left: 24),
                      child: Row(
                        children: [
                          Text("Recent".tr,
                              style: TextStyle(
                                  color: ColorConstant.gray900,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500)),
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowdownGray600,
                              height: getSize(20),
                              width: getSize(20),
                              margin: getMargin(left: 6, top: 1)),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: Text("All Status".tr,
                                style: TextStyle(
                                    color: ColorConstant.gray900,
                                    fontSize: getFontSize(16),
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500)),
                          ),
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowdownGray600,
                              height: getSize(20),
                              width: getSize(20),
                              margin: getMargin(left: 6))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return Center(
                            child: CustomLoadingWidget(
                                animationController: animationController),
                          );
                        } else if (controller.error.value.isNotEmpty) {
                          return Center(
                            child: ResponsiveErrorWidget(
                              errorMessage: controller.error.value,
                              onRetry: () {
                                controller.getUser();
                              },
                              fullPage: true,
                            ),
                          );
                        } /* else if (controller.payments.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 40
                            ),
                            child: ResponsiveEmptyWidget(
                              errorMessage: 'No Transactions found',
                              smallMessage: 'Your Transactions will appear here',
                              buttonText: "Ooops",
                              onRetry: () {
                                _refresh();
                              },
                              fullPage: true,
                            ),
                          );
                        }  */
                        else {
                          return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            separatorBuilder: (context, index) =>
                                Divider(thickness: 0.1),
                            itemCount: controller.payments.length,
                            itemBuilder: (context, index) {
                              Payment payment = controller.payments[index];
                              return TransactionWidget(
                                  payment: payment,
                                  onTapTransCard: () {
                                    onTapTransCard(payment);
                                  });
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            )));
  }

  void onTapArrowleft12() {
    Get.back();
  }

  void onTapTransCard(Payment payment) {
    final transactionController = Get.put(TransactionOneController());
    transactionController.setSelectedPayment(payment);
    Get.to(
      () => TransactionOneScreen(selectedPayment: payment),
    );
  }
}
