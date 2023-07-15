import '../controller/request_detail_controller.dart';
import '../models/request_detail_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class RequestDetailItemWidget extends StatelessWidget {
  RequestDetailItemWidget(
    this.requestDetailItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RequestDetailItemModel requestDetailItemModelObj;

  var controller = Get.find<RequestDetailController>();

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
                requestDetailItemModelObj.budgetTxt.value,
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
                  requestDetailItemModelObj.priceTxt.value,
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
                  requestDetailItemModelObj.projectdurationTxt.value,
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
                    requestDetailItemModelObj.weekscounterTxt.value,
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
