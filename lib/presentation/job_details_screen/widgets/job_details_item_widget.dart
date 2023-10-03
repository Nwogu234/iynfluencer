import 'package:iynfluencer/data/models/Jobs/job_model.dart';

import '../controller/job_details_controller.dart';
import '../models/job_details_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class JobDetailsItemWidget extends StatelessWidget {
  JobDetailsItemWidget({
    required this.jobDetailsItemModelObj,
    required this.index,
  });

  final Job jobDetailsItemModelObj;
  final int index;

  var controller = Get.find<JobDetailsController>();

  @override
  Widget build(BuildContext context) {
    String? capitalizeFirstLetter(String? text) {
      if (text == null || text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                "lbl_budget".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiLight135Gray600,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Obx(
                () => Text(
                  "${capitalizeFirstLetter(jobDetailsItemModelObj.budgetFrom.toString())} ${capitalizeFirstLetter(jobDetailsItemModelObj.budgetTo.toString())}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold125Gray900a7,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: getPadding(
            left: 99,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "Project duration", // add project duration when created
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiLight135Gray600,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 3,
                ),
                child: Obx(
                  () => Text(
                    "10 Weeks", // add project duration when created
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold125Gray900a7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
