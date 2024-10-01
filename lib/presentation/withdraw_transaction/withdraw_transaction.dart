import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/withdrawal/withdraw_transaction.dart';
import 'package:iynfluencer/presentation/withdraw_transaction/controller/withdraw_transaction_controller.dart';
import 'package:iynfluencer/presentation/withdraw_transaction/widget/withdraw_widget.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';

class WithdrawTransactionScreen extends StatefulWidget {
  const WithdrawTransactionScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawTransactionScreen> createState() => _WithdrawTransactionScreenState();
}

class _WithdrawTransactionScreenState extends State<WithdrawTransactionScreen> 
  with SingleTickerProviderStateMixin {

 late AnimationController animationController;
  final controller = Get.put(WithdrawTransactionController());

    
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
        title: AppbarTitle(text: "Withdrawals".tr),
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
              child: ResponsiveErrorWidget(
                errorMessage: controller.error.value,
                onRetry: () {
                  controller.getUser();
                },
                fullPage: true,
              ),
            );
          } else if (controller.withTransaction.isEmpty) {
            return ResponsiveEmptyWidget(
                errorMessage: 'No withdrawals found',
                smallMessage: 'Your withdrawals will appear here',
                buttonText: "Ooops",
                onRetry: () {});
          } else {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemCount: controller.withTransaction.length,
              separatorBuilder: (context, index) => Divider(thickness: 0.1),
              itemBuilder: (context, index) {
                TransactionDoc withdrawals = controller.withTransaction[index];
                return WithdrawalWidget(withdrawal: withdrawals);
              },
            );
          }
        }),
      ),
    );
  }

 
  void onTapArrowleft12() {
    Get.back();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}