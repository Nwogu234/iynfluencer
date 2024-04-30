import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/core/utils/color_constant.dart';
import 'package:iynfluencer/core/utils/image_constant.dart';
import 'package:iynfluencer/core/utils/size_utils.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';
import 'package:iynfluencer/presentation/search_results_screen/controller/search_results_controller.dart';
import 'package:iynfluencer/theme/app_decoration.dart';
import 'package:iynfluencer/theme/app_style.dart';
import 'package:iynfluencer/widgets/custom_button.dart';
import 'package:iynfluencer/widgets/custom_image_view.dart';

class TrendingResultItemWidget extends StatelessWidget {
  TrendingResultItemWidget({Key? key, required this.influencer})
      : super(key: key);

  final Influencer influencer;

  var controller = Get.find<SearchResultsController>();

  @override
  Widget build(BuildContext context) {

    String? avatarUrl =
        "https://iynfluencer.s3.us-east-1.amazonaws.com/users/avatars/user-${influencer.userId}-avatar.jpeg";
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
                                                  "${capitalizeFirstLetter(influencer.user?.first.country)}"
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
          ));
  }

  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileDetailsOneScreen,
    );
  }
}
