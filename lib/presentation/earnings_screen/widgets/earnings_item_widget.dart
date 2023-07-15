import '../controller/earnings_controller.dart';
import '../models/earnings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class EarningsItemWidget extends StatelessWidget {
  EarningsItemWidget(
    this.earningsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EarningsItemModel earningsItemModelObj;

  var controller = Get.find<EarningsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Obx(
                () => Text(
                  earningsItemModelObj.typeTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSatoshiBold135Gray900ab,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 1,
                ),
                child: Text(
                  "lbl_mark_adebayo".tr,
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
                child: Obx(
                  () => Text(
                    earningsItemModelObj.priceTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSatoshiBold135Gray900ab,
                  ),
                ),
              ),
              Text(
                "lbl_mar_11_2023".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSatoshiLight12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
