import 'controller/edit_profile_jobs_controller.dart';
import 'models/edit_profile_jobs_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class EditProfileJobsPage extends StatelessWidget {
  EditProfileJobsPage({Key? key})
      : super(
          key: key,
        );

  EditProfileJobsController controller =
      Get.put(EditProfileJobsController(EditProfileJobsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 20,
                    top: 33,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle5060,
                        height: getVerticalSize(
                          190,
                        ),
                        width: getHorizontalSize(
                          335,
                        ),
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                          topRight: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: getPadding(
                          left: 12,
                          top: 15,
                          right: 12,
                          bottom: 15,
                        ),
                        decoration: AppDecoration.outlineIndigo504.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL6,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                                bottom: 2,
                              ),
                              child: Text(
                                "lbl_jufy_promotion".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900a7,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              svgPath: ImageConstant.imgFrameAmber500,
                              height: getSize(
                                16,
                              ),
                              width: getSize(
                                16,
                              ),
                              margin: getMargin(
                                bottom: 7,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 6,
                                right: 9,
                                bottom: 6,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_4_52".tr,
                                      style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle5060190x335,
                        height: getVerticalSize(
                          190,
                        ),
                        width: getHorizontalSize(
                          335,
                        ),
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                          topRight: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                        ),
                        margin: getMargin(
                          top: 22,
                        ),
                      ),
                      Container(
                        padding: getPadding(
                          left: 12,
                          top: 15,
                          right: 12,
                          bottom: 15,
                        ),
                        decoration: AppDecoration.outlineIndigo504.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL6,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                                bottom: 2,
                              ),
                              child: Text(
                                "lbl_jufy_promotion".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900a7,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              svgPath: ImageConstant.imgFrameAmber500,
                              height: getSize(
                                16,
                              ),
                              width: getSize(
                                16,
                              ),
                              margin: getMargin(
                                bottom: 7,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 6,
                                right: 9,
                                bottom: 6,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_4_52".tr,
                                      style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle50601,
                        height: getVerticalSize(
                          190,
                        ),
                        width: getHorizontalSize(
                          335,
                        ),
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                          topRight: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                        ),
                        margin: getMargin(
                          top: 22,
                        ),
                      ),
                      Container(
                        padding: getPadding(
                          left: 12,
                          top: 15,
                          right: 12,
                          bottom: 15,
                        ),
                        decoration: AppDecoration.outlineIndigo504.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL6,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                                bottom: 2,
                              ),
                              child: Text(
                                "lbl_jufy_promotion".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold14Gray900a7,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              svgPath: ImageConstant.imgFrameAmber500,
                              height: getSize(
                                16,
                              ),
                              width: getSize(
                                16,
                              ),
                              margin: getMargin(
                                bottom: 7,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 6,
                                right: 9,
                                bottom: 6,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_4_52".tr,
                                      style: TextStyle(
                                        color: ColorConstant.gray900,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.blueGray400,
                                        fontSize: getFontSize(
                                          13,
                                        ),
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
