import '../controller/search_influncers_controller.dart';
import '../models/trending_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class TrendingItemWidget extends StatelessWidget {
  TrendingItemWidget(
    this.trendingItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TrendingItemModel trendingItemModelObj;

  var controller = Get.find<SearchInfluncersController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 13,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle505554x54,
                height: getSize(
                  54,
                ),
                width: getSize(
                  54,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    27,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 4,
                ),
                child: Text(
                  "lbl_mark_james".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold10Gray900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
