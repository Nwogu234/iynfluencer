import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController controller = Get.put(SplashController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray90001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 204, right: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgIcon011,
                          height: getSize(120),
                          width: getSize(120)),
                      Text("lbl_iynfluencer".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBlack36),
                      Padding(
                          padding: getPadding(top: 28, bottom: 5),
                          child: Container(
                              height: getVerticalSize(7),
                              width: getHorizontalSize(326),
                              decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700C1,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(3))),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(3)),
                                  child: Obx(() => LinearProgressIndicator(
                                      value: controller.progress.value,
                                      backgroundColor:
                                          ColorConstant.whiteA700C1,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          ColorConstant.cyan300)))))
                      )]))));
  }
}
