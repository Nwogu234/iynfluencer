import 'package:iynfluencer/data/models/Jobs/job_influencer_model.dart';
import 'package:iynfluencer/data/models/Jobs/job_model.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controller/earnings_controller.dart';
import '../models/earnings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class EarningsItemWidget extends StatelessWidget {
  EarningsItemWidget({
    Key? key,
    this.earningsItemModelObj,
  }) : super(
          key: key,
        );

  Jobz? earningsItemModelObj;

  @override
  Widget build(BuildContext context) {
     DateTime? parsedDate =
        DateTime.tryParse(earningsItemModelObj?.createdAt ?? "lbl_mar_18_2023".tr);
    String formattedDate = parsedDate != null
        ? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
        : 'Unknown Date';

  String? capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: getHorizontalSize(358),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgEye42x42,
                  height: getSize(
                    42,
                  ),
                  width: getSize(
                    42,
                  ),
                  radius: BorderRadius.circular(
                    getSize(
                      21.0,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 12,
                    top: 1,
                    bottom: 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (earningsItemModelObj?.title ?? '').length > 25
                         ? (earningsItemModelObj?.title?.substring(0, 25) ?? '')
                         : (earningsItemModelObj?.title ?? ''),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiBold135Gray900ab,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 1,
                        ),
                        child: Text(
                           truncateWithEllipsis(
                              myString: earningsItemModelObj?.description ?? '',
                              textLength: 25,
                            ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiLight125,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: getPadding(
                    top: 1,
                    bottom: 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          right: 1,
                        ),
                        child: Text(
                          '\$${((earningsItemModelObj?.amount ?? 0) / 100).toString()}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSatoshiBold135Gray900ab,
                        ),
                      ),
                      Text(
                        "$formattedDate".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSatoshiLight12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
              Padding(
                 padding: getPadding(top: 14),
                    child: Divider(
                      height: getVerticalSize(1),
                     thickness: getVerticalSize(1),
                    color: ColorConstant.indigo50))
          ],
        ),
      ),
    );
  }

  
}



