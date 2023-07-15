import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_search_view.dart';

// ignore: must_be_immutable
class AppbarSearchview2 extends StatelessWidget {
  AppbarSearchview2({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: getHorizontalSize(
          295,
        ),
        focusNode: FocusNode(),
        autofocus: true,
        controller: controller,
        hintText: hintText,
        prefix: Container(
          margin: getMargin(
            left: 13,
            top: 10,
            right: 5,
            bottom: 10,
          ),
          child: CustomImageView(
            svgPath: ImageConstant.imgSearch,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: getVerticalSize(
            38,
          ),
        ),
        suffix: Container(
          margin: getMargin(
            left: 30,
            top: 7,
            right: 10,
            bottom: 7,
          ),
          child: CustomImageView(
            svgPath: ImageConstant.imgSignal,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: getVerticalSize(
            38,
          ),
        ),
      ),
    );
  }
}
