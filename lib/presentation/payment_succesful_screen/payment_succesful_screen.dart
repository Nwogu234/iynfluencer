import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iynfluencer/data/apiClient/api_client.dart';
import 'package:iynfluencer/data/apiClient/notificationApi.dart';
import 'package:iynfluencer/data/general_controllers/notification_service.dart';
import 'package:iynfluencer/data/general_controllers/user_controller.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';
import 'package:iynfluencer/presentation/home_creator_container_screen/controller/home_creator_container_controller.dart';
import 'package:iynfluencer/widgets/custom_bottom_bar.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'controller/payment_succesful_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PaymentSuccesfulScreen extends GetWidget<PaymentSuccesfulController> {
  PaymentSuccesfulScreen({Key? key})
      : super(
          key: key,
        );

  final args = Get.arguments as BidsArguments;
  final notificationClient = NotificationClient();
  final NotificationService notificationService = Get.find();
  final storage = new FlutterSecureStorage();
  final apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 20,
            top: 23,
            right: 20,
            bottom: 23,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgCancel,
                height: getSize(
                  36,
                ),
                width: getSize(
                  36,
                ),
                alignment: Alignment.centerRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIcons8checkmark,
                height: getSize(
                  54,
                ),
                width: getSize(
                  54,
                ),
                margin: getMargin(
                  top: 84,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 35,
                ),
                child: Text(
                  "msg_payment_successful".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold20,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  292,
                ),
                margin: getMargin(
                  left: 21,
                  top: 5,
                  right: 20,
                  bottom: 5,
                ),
                child: Text(
                  "msg_your_payment_as".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtH2Gray600,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          onTap: () {
            onTapAfter(args);
          },
          height: getVerticalSize(
            46,
          ),
          text: "lbl_done".tr,
          margin: getMargin(
            left: 20,
            right: 20,
            bottom: 31,
          ),
          padding: ButtonPadding.PaddingAll15,
        ),
      ),
    );
  }

  onTapAfter(BidsArguments bidsArguments) async {
    final JobBids? data = args.jobBid;
    final bidId = data?.bidId ?? '';
    final userId = data?.influencer?.userId ?? '';
    final Job job = args.job;
    final jobTitle = job.title;
    final UserController user = Get.find();

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    final names =
        "${capitalizeFirstLetter(job.user?.firstName ?? '')} ${capitalizeFirstLetter(job.user?.lastName ?? '')}";
    await OneSignal.login(userId);
    Response response = Response();
    var token = await storage.read(key: "token");
    response = await apiClient.hireInfluencerForAJob(bidId, token);
    if (response.isOk) {
      if (response.body['status'] == 'SUCCESS') {
        Get.snackbar('Success', 'Influencer Hired');
        print('Success : Influencer Hired');
      }
    }

    await OneSignal.login(userId);
    if (jobTitle != null) {
      try {
        print('Sending notification to recipient');
        await notificationClient.sendNotification(
            'Job update: $jobTitle', '$names has hired you', userId, null);

        await notificationService.createNotification(
            'Job update: $jobTitle', '$names', 'Hire', ImageConstant.logo);
        print('Notification sent and saved to Firestore');
      } catch (e) {
        print('Error sending notification: $e');
      }
    } else {
      print('name is null');
    }
    if (user.userModelObj.value.creatorId != null) {
      storage.write(key: "activeProfile", value: "Creator");
      Get.delete<TabController>();
      Get.offAllNamed(
        AppRoutes.homeCreatorContainerScreen,
      );
      // controller.dispose();
    } else {
      Get.offAllNamed(
        AppRoutes.completeProfileCreatorScreen,
      );
    }
  }
}
