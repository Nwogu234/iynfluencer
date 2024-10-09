import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return InkWell(
      onTap: () {
        onTapDetailcard?.call();
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                           truncateWithEllipsis(
                                  myString: creatorJobslistModelObj.title ?? '',
                                  textLength: 30,
                                   ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold16
                              .copyWith(fontSize: 14.sp)),
                    ),
                    Text(
                      timeago.format(
                          DateTime.parse(creatorJobslistModelObj.createdAt!)),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSatoshiBold125Gray900a7.copyWith(
                          fontSize: 12.5.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: 350.w,
                    decoration:
                      AppDecoration.outlineIndigo508.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder7,),


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          truncateWithEllipsis(
                              myString: creatorJobslistModelObj.description!),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold125Gray900a7,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.cyan100,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Icon(
                                FontAwesomeIcons.dollarSign,
                                size: 15,
                                color: ColorConstant.whiteA700,
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_budget".tr,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 12.5.sp)
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                        "\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetFrom.toString())}-\$${capitalizeFirstLetter(creatorJobslistModelObj.budgetTo.toString())}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold125Gray900a7),
                                  ),
                                ]),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.pink,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Icon(
                                FontAwesomeIcons.calendarDay,
                                size: 15,
                                color: ColorConstant.whiteA700,
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Duration".tr,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 12.5.sp)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                        "${creatorJobslistModelObj.duration} days",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold125Gray900a7),
                                  ),
                                ]),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.gray90001,
                                shape: BoxShape.circle),
                            child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Icon(
                                  FontAwesomeIcons.gavel,
                                  size: 15,
                                  color: ColorConstant.whiteA700,
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bids".tr,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSatoshiBold16
                                          .copyWith(fontSize: 12.5.sp)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                        "${creatorJobslistModelObj.bidsCount} bids",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSatoshiBold125Gray900a7),
                                  ),
                                ]),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ])),
    );
  }
}
