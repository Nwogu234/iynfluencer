import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/notification/notification_model';
import 'package:iynfluencer/presentation/notification_firestore/controller/notification_controller.dart';
import 'package:iynfluencer/presentation/notification_firestore/widget/notification_widget.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_loading.dart';
import 'package:iynfluencer/widgets/error_widget.dart';
import 'package:iynfluencer/widgets/skeletons.dart';

class NotificationFirestore extends StatefulWidget {
  NotificationFirestore({Key? key}) : super(key: key);

  @override
  State<NotificationFirestore> createState() => _NotificationFirestoreState();
}

class _NotificationFirestoreState extends State<NotificationFirestore>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(NotificationController());
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
        title: AppbarTitle(text: "lbl_notifications".tr),
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
          } else if (controller.notifications.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 200,
                horizontal: 40
              ),
              child: ResponsiveEmptyWidget(
                  errorMessage: 'No Notifications found',
                  smallMessage: 'Your Notifications will appear here',
                  buttonText: "Ooops",
                  onRetry: () {}),
            );
          } else {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemCount: controller.notifications.length,
              separatorBuilder: (context, index) => Divider(thickness: 0.1),
              itemBuilder: (context, index) {
                MNotification notification = controller.notifications[index];
                return NotificationWidget(notication: notification);
              },
            );
          }
        }),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  void onTapArrowleft12() {
    Get.back();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
