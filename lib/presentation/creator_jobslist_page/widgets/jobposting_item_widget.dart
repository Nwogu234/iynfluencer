import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import '../controller/creator_jobslist_controller.dart';

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
      imageProvider = NetworkImage('https://cdn-icons-png.flaticon.com/512/6915/6915987.png');
    }

    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    DateTime? parsedDate = DateTime.tryParse(creatorJobslistModelObj.createdAt ?? '');
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

    return GestureDetector(
      onTap: () {
        onTapDetailcard?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 19.w, right: 26.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Text(
                      "${creatorJobslistModelObj.title}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold125Gray900a7,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Text(
                      "$formattedDate",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiLight135Gray600,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgVector,
                    height: 1.h,
                    width: 13.w,
                    margin: EdgeInsets.only(top: 22.h, bottom: 21.h),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 321.w,
            margin: EdgeInsets.only(left: 20.w, top: 8.h, right: 33.w),
            child: Text(
              "${creatorJobslistModelObj.description}",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtSatoshiLight135Gray600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.w, top: 14.h, right: 88.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_budget".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold125Gray900a7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetFrom.toString())}-\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetTo.toString())}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135Gray600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "msg_project_duration".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold125Gray900a7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "${creatorJobslistModelObj.duration} days",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight135Gray600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Container(
              margin: EdgeInsets.only(top: 18.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: AppDecoration.outlineIndigo501,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5066,
                    height: 181.h,
                    width: 335.w,
                    radius: BorderRadius.circular(7.r),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 14.h, right: 5.w, bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${creatorJobslistModelObj.bidsCount ?? 0}",
                                style: TextStyle(
                                  color: ColorConstant.gray900E5,
                                  fontSize: 13.sp,
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
                              TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: ColorConstant.cyan300,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 13.w),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Hired".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: 13.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                    color: ColorConstant.cyan300,
                                    fontSize: 11.5.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "${creatorJobslistModelObj.hired}",
                                  style: TextStyle(
                                    color: ColorConstant.gray900E5,
                                    fontSize: 13.sp,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgEyeGray600,
                          height: 18.h,
                          width: 18.w,
                          margin: EdgeInsets.only(left: 13.w),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, bottom: 1.h),
                          child: Text(
                            "lbl_865".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSatoshiBold115Gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
