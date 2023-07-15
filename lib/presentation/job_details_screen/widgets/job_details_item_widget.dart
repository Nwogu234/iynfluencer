import '../controller/job_details_controller.dart';
import '../models/job_details_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class JobDetailsItemWidget extends StatelessWidget {
  JobDetailsItemWidget(
    this.jobDetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  JobDetailsItemModel jobDetailsItemModelObj;

  var controller = Get.find<JobDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                jobDetailsItemModelObj.budgetTxt.value,
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
                  jobDetailsItemModelObj.priceTxt.value,
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
                  jobDetailsItemModelObj.projectdurationTxt.value,
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
                    jobDetailsItemModelObj.weekscounterTxt.value,
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
