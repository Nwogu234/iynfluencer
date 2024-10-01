import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iynfluencer/data/models/JobBids/job_bids_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:iynfluencer/presentation/bids_screen/widgets/bids_arguement.dart';
import 'package:iynfluencer/presentation/creator_after_job_detail_screen/controller/creator_after_job_detailcontroller.dart';
import 'package:iynfluencer/widgets/skeletons.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../job_details_screen/widgets/job_details_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_image.dart';
import 'package:iynfluencer/widgets/app_bar/appbar_title.dart';
import 'package:iynfluencer/widgets/app_bar/custom_app_bar.dart';
import 'package:iynfluencer/widgets/custom_button.dart';

class CreatorAfterJobDetailsScreen extends GetWidget< CreatorAfterJobDetailsController> {
 CreatorAfterJobDetailsScreen({Key? key}) : super(key: key);



  final args = Get.arguments as BidsArguments;

  @override
  Widget build(BuildContext context) {
   
     final JobBids? data = args.jobBid;
    final Job? selectedJob = args.job;

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

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
                margin: getMargin(left: 20, top: 9, bottom: 9),
                onTap: () {
                  onTapArrowleft16();
                }),
            centerTitle: true,
            title: AppbarTitle(
              text: "lbl_job_details".tr,
              ),
            styleType: Style.bgOutlineIndigo50_1),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 25),
            child: Padding(
              padding: getPadding(bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(left: 19),
                            child: Text("${selectedJob?.title}".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold18)),
                        Align(
                         alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(right: 19),
                            child: CustomImageView(
                             svgPath: ImageConstant.imgFrameDustbin,
                             height: getSize(
                                18,
                              ),
                             width: getSize(
                              18,
                              ),
                             margin: getMargin(
                               bottom: 2,
                              ),
                             color: ColorConstant.cyan100,
                          ),
                          ),
                        ),
                      ],
                    ),
                     Padding(
                       padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 5
                       ),
                       child: Text(
                            'Posted on ${timeago.format(DateTime.parse(selectedJob?.createdAt  ??  ""))} ',
                               style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500
                     ),
                        ),
                     ),
                   CustomImageView(
                        imagePath: ImageConstant.imgRectangle5069,
                        height: getVerticalSize(221),
                        width: getHorizontalSize(375),
                        margin: getMargin(top: 22)), 
                    Padding(
                        padding: getPadding(left: 20, top: 27),
                        child: Text("lbl_description".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold14Gray900.copyWith(
                              fontSize: 16.sp
                            ))),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                             padding: EdgeInsets.only(
                              bottom: 15
                             ),
                            decoration: AppDecoration.outlineIndigo501,
                            width: getHorizontalSize(324),
                            margin: getMargin(left: 20, top: 5, right: 30),
                            child: Text("${selectedJob?.description}",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiLight13Gray900ab.copyWith(
                                  fontSize: 13.5.sp
                                )))),
                    Padding(
                        padding: getPadding(left: 20, top: 29),
                        child: Text("lbl_responsiblities".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold14Gray900.copyWith(
                              fontSize: 16.sp
                            ))),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 15
                             ),
                          decoration: AppDecoration.outlineIndigo501,
                          width: getHorizontalSize(334),
                          margin: getMargin(left: 20, top: 5, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                selectedJob!.responsibilities!.map((mediaFile) {
                              return Padding(
                                  padding: getPadding(top: 7),
                                  child: Text(
                                      mediaFile, //duration,budget,list of r4
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSatoshiLight13Gray900ab.copyWith(
                                            fontSize: 13.5.sp
                                          )));
                            }).toList(),
                          ),
                        )),
                             Padding(
                                  padding:
                                      getPadding(left: 20, top: 27, right: 44),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_influencer".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight135Gray600),
                                              Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        url: data
                                                                ?.influencer
                                                                ?.user
                                                                ?.avatar ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                        height: getSize(30),
                                                        width: getSize(30),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getSize(15.0))),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 12,
                                                            top: 7,
                                                            bottom: 3),
                                                        child: Text(
                                                            "${data!.influencer!.user!.firstName!.capitalize} ${data!.influencer!.user!.lastName!.capitalize}"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtSatoshiBold14Gray900ab))
                                                  ]))
                                            ]),
                                        Padding(
                                            padding:
                                                getPadding(top: 2, bottom: 3),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_project_status".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight135Gray600),
                                                  CustomButton(
                                                    height: getVerticalSize(25),
                                                    width:
                                                        getHorizontalSize(83),
                                                    text: capitalizeFirstLetter(
                                                        data.status!),
                                                    margin: getMargin(top: 3),
                                                    variant: data.status ==
                                                            'pending'
                                                        ? ButtonVariant
                                                            .FillRed10099
                                                        : ButtonVariant
                                                            .FillGreenA10099,
                                                    shape: ButtonShapes
                                                        .RoundedBorder12,
                                                    padding: ButtonPadding
                                                        .PaddingAll4,
                                                    fontStyle: data.status ==
                                                            'pending'
                                                        ? ButtonFontStyle
                                                            .SatoshiBold115Red700
                                                        : ButtonFontStyle
                                                            .SatoshiBold115Green700,
                                                  )
                                                ]))
                                      ])),
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 15, right: 50),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_project_cost".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight135Gray600),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 7),
                                                      child: Text(
                                                         // '\$${data.price}'.tr,
                                                         '\$${((data!.price ?? 0) / 100).toString()}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSatoshiBold125Gray900a7))
                                                ])),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_deadline".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSatoshiLight135Gray600),
                                              Padding(
                                                  padding: getPadding(top: 9),
                                                  child: Text(
                                                      DateFormat("yyyy-MM-dd").format(
                                                DateTime.parse(data?.createdAt ?? '')),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiBold125Gray900a7))
                                            ])
                                      ])),
                              Padding(
                                  padding:
                                      getPadding(left: 20, top: 15, right: 50),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("Project status".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSatoshiLight135Gray600),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 7),
                                                      child: Text(
                                                         // '\$${data.price}'.tr,
                                                         'Success',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtSatoshiBold125Gray900a7))
                                                ])),
                                      ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 10),
                      child: Divider(
                        color: ColorConstant.indigo50,
                        thickness: 2,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: getMargin(left: 20, right: 20, bottom: 20),
            decoration: AppDecoration.outlineIndigo507,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                    height: getVerticalSize(44),
                    text: "Hire".tr,
                    padding: ButtonPadding.PaddingAll12,
                    onTap: () {
                    controller.hireInfluencerFunc(data!.bidId!, args);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }
}
