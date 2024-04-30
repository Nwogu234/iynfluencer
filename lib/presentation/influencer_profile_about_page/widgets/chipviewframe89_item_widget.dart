import '../models/chipviewframe89_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/data/models/Influencer/influencer_response_model.dart';

// ignore: must_be_immutable
class Chipviewframe89ItemWidget extends StatelessWidget {
  Chipviewframe89ItemWidget(
      this.chipviewframe89ItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  Chipviewframe89ItemModel chipviewframe89ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        left: 10,
        right: 10,
      ),
      elevation: 0,
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "${chipviewframe89ItemModelObj.chipviewframe89ModelObj ?? ''}",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.normal,
        ),
      ),
      selected: chipviewframe89ItemModelObj.isSelected.value,
      backgroundColor: ColorConstant.gray200E5,
      selectedColor: ColorConstant.gray200E5,
      shape: chipviewframe89ItemModelObj.isSelected.value
          ? RoundedRectangleBorder(
        side: BorderSide.none,
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
        chipviewframe89ItemModelObj.isSelected.value = value;
      },
    );
  }
}
