import 'controller/community_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_button.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CommunityPostScreen extends GetWidget<CommunityPostController> {
  const CommunityPostScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            57,
          ),
          leadingWidth: 44,
          leading: AppbarImage(
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgArrowright,
            margin: getMargin(
              left: 20,
              top: 17,
              bottom: 16,
            ),
          ),
          actions: [
            AppbarButton(
              margin: getMargin(
                left: 21,
                top: 13,
                right: 21,
                bottom: 12,
              ),
            ),
          ],
          styleType: Style.bgShadowGray9000c,
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 20,
            top: 35,
            right: 20,
            bottom: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: controller.inputController,
                hintText: "msg_what_do_you_want".tr,
                margin: getMargin(
                  left: 1,
                  right: 40,
                ),
                variant: TextFormFieldVariant.None,
                fontStyle: TextFormFieldFontStyle.SatoshiBold22,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 23,
                  ),
                  padding: getPadding(
                    left: 28,
                    top: 33,
                    right: 28,
                    bottom: 33,
                  ),
                  decoration: AppDecoration.outlineGray20002.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder7,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          236,
                        ),
                        margin: getMargin(
                          left: 22,
                          top: 1,
                          right: 20,
                        ),
                        child: Text(
                          "msg_upload_media_files".tr,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtSatoshiLight13,
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          43,
                        ),
                        text: "lbl_select_media".tr,
                        margin: getMargin(
                          top: 13,
                        ),
                        variant: ButtonVariant.OutlineGray300b2,
                        padding: ButtonPadding.PaddingAll12,
                        fontStyle: ButtonFontStyle.SatoshiLight14,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 30,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_hash_tags".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiLight13Gray900,
                    ),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: controller.frametwelveController,
                      hintText: "msg_eg_comedy_arts2".tr,
                      margin: getMargin(
                        top: 6,
                      ),
                      padding: TextFormFieldPadding.PaddingT14,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                        margin: getMargin(
                          left: 30,
                          top: 14,
                          right: 13,
                          bottom: 14,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowdownGray600,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          48,
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
    );
  }
}
