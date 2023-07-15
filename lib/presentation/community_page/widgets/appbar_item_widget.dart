import '../controller/community_controller.dart';
import '../models/appbar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class AppbarItemWidget extends StatelessWidget {
  AppbarItemWidget(
    this.appbarItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AppbarItemModel appbarItemModelObj;

  var controller = Get.find<CommunityController>();

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgGroup85240x40,
      height: getSize(
        40,
      ),
      width: getSize(
        40,
      ),
      radius: BorderRadius.circular(
        getSize(
          20.0,
        ),
      ),
      margin: getMargin(
        left: 31,
      ),
    );
  }
}
