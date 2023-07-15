import '../models/chipviewframe91_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class Chipviewframe91ItemWidget extends StatelessWidget {
  Chipviewframe91ItemWidget(
    this.chipviewframe91ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Chipviewframe91ItemModel chipviewframe91ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: getPadding(
          left: 10,
          right: 10,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewframe91ItemModelObj.frame898Txt.value,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ColorConstant.gray900,
            fontSize: getFontSize(
              14,
            ),
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w300,
          ),
        ),
        selected: chipviewframe91ItemModelObj.isSelected.value,
        backgroundColor: ColorConstant.gray200E5,
        selectedColor: ColorConstant.gray200E5,
        shape: chipviewframe91ItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConstant.gray90099,
                  width: getHorizontalSize(
                    1,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    6,
                  ),
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    6,
                  ),
                ),
              ),
        onSelected: (value) {
          chipviewframe91ItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
