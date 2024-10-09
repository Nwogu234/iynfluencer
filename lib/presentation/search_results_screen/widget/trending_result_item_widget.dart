import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/controller/search_results_controller.dart';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_button_two.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';

class TrendingResultItemWidget extends StatelessWidget {
  TrendingResultItemWidget({Key? key, required this.influencer})
      : super(key: key);

  final Influencer influencer;

  var controller = Get.find<SearchResultsController>();

  @override
  Widget build(BuildContext context) {
    String? avatarUrl = influencer.user?.first.avatar;
    //  "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${influencer.userId}-avatar.jpeg";
    // Assuming this is a String
    String imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = avatarUrl;
    } else {
      imageProvider = "mypic.wit";
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SafeArea(
        child: Container(
          height: 900.h,
            padding: getPadding(left: 6, top: 19, right: 1, bottom: 19),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: getPadding(left: 20),
                      child: Text("lbl_influencers".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold16
                              .copyWith(fontWeight: FontWeight.w600))),
                  Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 20, top: 16, right: 20, bottom: 16),
                    child: Row(children: [
                      Stack(
                        children: [
                          CustomImageView(
                            fit: BoxFit.cover,
                            url: imageProvider,
                            height: getSize(55),
                            width: getSize(55),
                            radius: BorderRadius.circular(getSize(27.5)),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: ColorConstant.cyan100,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Center(
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgArrowMark,
                                    height: getSize(5),
                                    width: getSize(5),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "${capitalizeFirstLetter(influencer.user?.first.firstName)} ${capitalizeFirstLetter(influencer.user?.first.lastName)}"
                                          .length >
                                      10
                                  ? "${capitalizeFirstLetter(influencer.user?.first.firstName)} ${capitalizeFirstLetter(influencer.user?.first.lastName)}"
                                          .substring(0, 7) +
                                      "..."
                                  : "${capitalizeFirstLetter(influencer.user?.first.firstName)} ${capitalizeFirstLetter(influencer.user?.first.lastName)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSatoshiBold16.copyWith(
                                fontSize: 16.sp,
                                color: ColorConstant.black900,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 5),
                          Text(
                            "${influencer.jobsDone.toString()} jobs completed"
                                .tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiLight14Gray900a2.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      CustomButtonTwo(
                        shape: ButtonShape.RoundedBorderz12,
                        height: getVerticalSize(42),
                        width: getHorizontalSize(120),
                        text: 'Message'.tr,
                        onTap: onTapEditprofile,
                        padding: ButtonPaddingz.PaddingAll12,
                        fontStyle: ButtonFontStylez.SatoshiBold15,
                      )
                    ]),
                  )
                ])));
  }

  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileDetailsOneScreen,
    );
  }
}


 /*        child: Container(
            padding: getPadding(left: 6, top: 19, right: 1, bottom: 19),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: getPadding(left: 20),
                      child: Text("lbl_influencers".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold16
                              .copyWith(fontWeight: FontWeight.w600))),
                  Padding(
                      padding: getPadding(left: 22, top: 16),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: ColorConstant.indigo50,
                                  width: getHorizontalSize(1)),
                              borderRadius: BorderRadiusStyle.roundedBorder17),
                          child: Container(
                            height: getVerticalSize(268),
                            width: getHorizontalSize(320),
                            decoration: AppDecoration.outlineIndigo50.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder17),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle5059,
                                    fit: BoxFit.cover,
                                    height: getVerticalSize(102),
                                    width: getHorizontalSize(322),
                                    alignment: Alignment.topCenter),
                                SizedBox(
                                  height: getVerticalSize(200),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                              ),
                                              child: CustomImageView(
                                                  url: imageProvider,
                                                  fit: BoxFit.cover,
                                                  height: getVerticalSize(71),
                                                  width: getHorizontalSize(68),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(35))),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "${capitalizeFirstLetter(influencer.user?.first.firstName)}"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSatoshiBold14Black900
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      18)),
                                                      Text(
                                                          '${capitalizeFirstLetter(influencer.user?.first.lastName)}'
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSatoshiBold14Black900
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      18)),
                                                    ],
                                                  ),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(34),
                                                      width: getHorizontalSize(
                                                          110),
                                                      text: "Message".tr,
                                                      margin:
                                                          getMargin(top: 13),
                                                      variant: ButtonVariant
                                                          .FillGray200ab,
                                                      padding: ButtonPadding
                                                          .PaddingAll4,
                                                      fontStyle: ButtonFontStyle
                                                          .SatoshiBold15Gray900,
                                                      onTap: () {
                                                        onTapEditprofile();
                                                      }),
                                                ]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 13,
                                              ),
                                              child: Text(
                                                  "${influencer.user?.first.country}"
                                                      .tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiBold16
                                                      .copyWith(
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 11,
                                                      vertical: 2),
                                              child: Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgFrameAmber500,
                                                    height: getSize(18),
                                                    width: getSize(18),
                                                    margin: getMargin(
                                                      bottom: 4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 6,
                                                      bottom: 3,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "lbl_3_52".tr,
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .gray900,
                                                              fontSize:
                                                                  getFontSize(
                                                                13.5,
                                                              ),
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: " ",
                                                            style: TextStyle(
                                                              color: ColorConstant
                                                                  .blueGray400,
                                                              fontSize:
                                                                  getFontSize(
                                                                13.5,
                                                              ),
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgFrameBlueGray400,
                                                    height: getSize(
                                                      15,
                                                    ),
                                                    width: getSize(
                                                      15,
                                                    ),
                                                    margin: getMargin(
                                                      bottom: 4,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                        left: 4, bottom: 4),
                                                    child: Text(
                                                        "${influencer.jobsDone.toString()} jobs completed"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtSatoshiBold16
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize:
                                                                    13.5)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))),
                  Padding(
                      padding: getPadding(left: 25, top: 13, bottom: 5),
                      child: Text("lbl_view_all".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold16.copyWith(
                              color: ColorConstant.cyan100, fontSize: 13)))
                ]),
          ) */