import 'controller/influencer_profile_review_controller.dart';
import 'models/influencer_profile_review_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

class InfluencerProfileReviewPage extends StatelessWidget {
  InfluencerProfileReviewPage({Key? key})
      : super(
          key: key,
        );

  InfluencerProfileReviewController controller = Get.put(
      InfluencerProfileReviewController(InfluencerProfileReviewModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    top: 30,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Container(
                          decoration: AppDecoration.outlineIndigo501,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse207,
                                    height: getSize(
                                      50,
                                    ),
                                    width: getSize(
                                      50,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      top: 6,
                                      bottom: 2,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_mark_adebayo".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiBold145,
                                        ),
                                        CustomTextFormField(
                                          width: getHorizontalSize(
                                            107,
                                          ),
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller:
                                              controller.locationController,
                                          hintText: "lbl_lagos_nigeria".tr,
                                          margin: getMargin(
                                            top: 2,
                                          ),
                                          variant: TextFormFieldVariant.None,
                                          fontStyle: TextFormFieldFontStyle
                                              .SatoshiLight14Gray600,
                                          prefix: Container(
                                            margin: getMargin(
                                              right: 6,
                                              bottom: 4,
                                            ),
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgFrameGray60015x15,
                                            ),
                                          ),
                                          prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              19,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgFrame905,
                                    height: getVerticalSize(
                                      15,
                                    ),
                                    width: getHorizontalSize(
                                      75,
                                    ),
                                    margin: getMargin(
                                      top: 4,
                                      bottom: 31,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: getHorizontalSize(
                                  312,
                                ),
                                margin: getMargin(
                                  left: 1,
                                  top: 27,
                                  right: 22,
                                  bottom: 21,
                                ),
                                child: Text(
                                  "msg_i_recently_came".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight13Gray900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Container(
                          margin: getMargin(
                            top: 38,
                          ),
                          decoration: AppDecoration.outlineIndigo501,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse207,
                                    height: getSize(
                                      50,
                                    ),
                                    width: getSize(
                                      50,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 16,
                                      top: 6,
                                      bottom: 2,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_mark_adebayo".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSatoshiBold145,
                                        ),
                                        CustomTextFormField(
                                          width: getHorizontalSize(
                                            107,
                                          ),
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller:
                                              controller.locationoneController,
                                          hintText: "lbl_lagos_nigeria".tr,
                                          margin: getMargin(
                                            top: 2,
                                          ),
                                          variant: TextFormFieldVariant.None,
                                          fontStyle: TextFormFieldFontStyle
                                              .SatoshiLight14Gray600,
                                          textInputAction: TextInputAction.done,
                                          prefix: Container(
                                            margin: getMargin(
                                              right: 6,
                                              bottom: 4,
                                            ),
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgFrameGray60015x15,
                                            ),
                                          ),
                                          prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              19,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgFrame905,
                                    height: getVerticalSize(
                                      15,
                                    ),
                                    width: getHorizontalSize(
                                      75,
                                    ),
                                    margin: getMargin(
                                      top: 4,
                                      bottom: 31,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: getHorizontalSize(
                                  312,
                                ),
                                margin: getMargin(
                                  left: 1,
                                  top: 27,
                                  right: 22,
                                  bottom: 21,
                                ),
                                child: Text(
                                  "msg_i_recently_came".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiLight13Gray900,
                                ),
                              ),
                            ],
                          ),
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
