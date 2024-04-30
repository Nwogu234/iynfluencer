import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import '../controller/creator_jobslist_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobpostingItemWidget extends StatelessWidget {
  final Job creatorJobslistModelObj;
  final int index;
  VoidCallback? onTapDetailcard;

  JobpostingItemWidget({
    required this.creatorJobslistModelObj,
    required this.index,
    this.onTapDetailcard,
  });

  var controller = Get.find<CreatorJobslistController>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: false);

    String? avatarUrl = creatorJobslistModelObj.user?.avatar;
    ImageProvider imageProvider;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = NetworkImage(avatarUrl);
    } else {
      imageProvider = NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/6915/6915987.png');
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    DateTime? parsedDate =
        DateTime.tryParse(creatorJobslistModelObj.createdAt ?? '');
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

    return GestureDetector(
      onTap: () {
        onTapDetailcard?.call();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  timeago.format(DateTime.parse(
                      creatorJobslistModelObj.createdAt!)),
                   overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.left,
                   style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w500
                   ),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
               child: Text(
                   "${creatorJobslistModelObj.title}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                   style: AppStyle.txtSatoshiBold16.copyWith(
                    fontSize: 14
                   )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                 child: Text(
                   truncateWithEllipsis(
                  myString: creatorJobslistModelObj.description!),
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold125Gray900a7,
                ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.blue1000,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomImageView(
                             imagePath: ImageConstant.imgFrameDollar,
                              height: getSize(25),
                              width: getSize(25),
                               margin: getMargin(
                                bottom: 4
                                ),
                                color: ColorConstant.cyan100,
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(left:10, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "lbl_budget".tr,
                             textAlign: TextAlign.left,
                             style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                             fontSize: 12.5.sp,
                             fontWeight: FontWeight.w500)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2
                              ),
                              child: Text(
                                 "\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetFrom.toString())}-\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetTo.toString())}",
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiBold16.copyWith(
                                  fontSize: 12.5.sp
                                 )
                              ),
                            ),
                          ]),
                      ),
                      SizedBox(width: 35),
                       Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.blue1000,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomImageView(
                             imagePath: ImageConstant.imgFrameBudget,
                              height: getSize(25),
                              width: getSize(25),
                               margin: getMargin(
                                bottom: 4
                                ),
                                color: ColorConstant.cyan100,
                          ),
                        ),
                      ),
                         Padding(
                        padding:EdgeInsets.only(left:10, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Project Duration".tr,
                             textAlign: TextAlign.left,
                             style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                             fontSize: 12.5.sp,
                             fontWeight: FontWeight.w500)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2
                              ),
                              child: Text(
                                  "${creatorJobslistModelObj.duration} days",
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: AppStyle.txtSatoshiBold16.copyWith(
                                  fontSize: 12.5.sp
                                 )
                              ),
                            ),
                          ]),
                      ),
                    ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                       CustomImageView(
                          imagePath: ImageConstant.imgframeBar,
                          height: 18.h,
                          width: 18.w,
                          color: ColorConstant.gray900A7,  
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, bottom: 1.h),
                          child: Text(
                          "${creatorJobslistModelObj.version}".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:  AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                             fontSize: 12.5.sp,
                             fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(width: 15),
                         RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${creatorJobslistModelObj.bidsCount ?? 0}",
                                style: TextStyle(
                                  color: ColorConstant.gray900E5,
                                  fontSize: 13.sp,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                               TextSpan(
                                text: "  ",
                                style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "lbl_bids".tr,
                                style: TextStyle(
                                  color: ColorConstant.gray600,
                                  fontSize: 13.sp,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 15),
                         RichText(
                            text: TextSpan(
                              children: [
                                    TextSpan(
                                  text: "${creatorJobslistModelObj.hired}",
                                  style: TextStyle(
                                    color: ColorConstant.gray900E5,
                                    fontSize: 13.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                               TextSpan(
                                  text: "  ",
                                  style: TextStyle(
                                    color: ColorConstant.cyan300,
                                    fontSize: 11.5.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "Hired".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: 13.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                    ]
                  ),
                )
              
          ],
        ),
      ),
       Divider()
          ]
        ))
    );
  }
}

