import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/widgets/custom_search_view.dart';
import 'package:iynfluencer/widgets/custom_search_view2.dart';

// ignore: must_be_immutable
class AppbarSearchview2 extends StatelessWidget {
  AppbarSearchview2({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
    this.initialQuery = '',
    this.query,
    this.onTap,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  final String initialQuery;

  final String? query;

  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView2(
        onSubmitted: onTap,
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
            color: ColorConstant.black900,
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
