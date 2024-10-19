import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/widgets/custom_small_button.dart';
import 'package:iynfluencer/widgets/custom_small_button2.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../data/models/Jobs/job_model.dart';
import '../controller/influencer_home_controller.dart';
import '../models/influencer_home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class InfluencerHomeItemWidget extends StatelessWidget {
  InfluencerHomeItemWidget(
    this._job, {
    Key? key,
    this.onTapJobpost,
    this.onTapBidpost,
  }) : super(
          key: key,
        );

  Jobz _job;

  var controller = Get.find<InfluencerHomeController>();

  VoidCallback? onTapJobpost;

  VoidCallback? onTapBidpost;

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapJobpost?.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            timeago.format(DateTime.parse(_job.createdAt!)),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                                fontSize: 12.5.sp, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: getPadding(top: 5),
                            child: Text("${_job.title}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold16
                                    .copyWith(fontSize: 14.5)),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  truncateWithEllipsis(myString: _job.description!),
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold125Gray900a7,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.blue1000,
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFrameDollar,
                          height: getSize(25),
                          width: getSize(25),
                          margin: getMargin(bottom: 4),
                          color: ColorConstant.cyan100,
                        ),
                      ),
                    ).animate(
                             delay: Duration(seconds: 1),  
                              onPlay: (controller) => controller.repeat(period: Duration(seconds: 3)), 
                      ).shakeY(
                             delay:Duration(seconds:1)
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_budget".tr,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7
                                    .copyWith(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                  "\$${capitalizeFirstLetter(_job.budgetFrom.toString())}-\$${capitalizeFirstLetter(_job.budgetTo.toString())}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold16
                                      .copyWith(fontSize: 12.5.sp)),
                            )
                          ]),
                    ),
                  ])),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.blue1000,
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFrameBudget,
                          height: getSize(25),
                          width: getSize(25),
                          margin: getMargin(bottom: 4),
                          color: ColorConstant.cyan100,
                        ),
                      ),
                    ).animate(
                             delay: Duration(seconds: 1),  
                              onPlay: (controller) => controller.repeat(period: Duration(seconds: 3)), 
                      ).shakeY(
                             delay:Duration(seconds:1)
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Project duration".tr,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSatoshiBold125Gray900a7
                                    .copyWith(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text("${_job.duration} days".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSatoshiBold16
                                      .copyWith(fontSize: 14.sp)),
                            )
                          ]),
                    ),
                  ])),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomSmallButton2(
                          height: getVerticalSize(50),
                          width: getHorizontalSize(150),
                          text: "View Details".tr,
                          padding: ButtonPadding.PaddingAll157,
                          onTap: () {
                            onTapJobpost?.call();
                          }),
                      CustomSmallButton(
                          height: getVerticalSize(50),
                          width: getHorizontalSize(150),
                          text: "Apply Now".tr,
                          padding: ButtonPaddings.PaddingAll15,
                          onTap: () {
                            onTapBidpost?.call();
                          }),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
