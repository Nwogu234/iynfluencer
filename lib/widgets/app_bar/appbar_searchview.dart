import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';
import 'package:iynfluencer/presentation/search_influncers_screen/search_influncers_screen.dart';
import 'package:iynfluencer/widgets/custom_search_view.dart';

import '../../presentation/search_filter_bottomsheet/controller/search_filter_controller.dart';
import '../../presentation/search_filter_bottomsheet/search_filter_bottomsheet.dart';

// ignore: must_be_immutable
class AppbarSearchview extends StatelessWidget {
  AppbarSearchview(
      {Key? key,
      this.hintText,
      this.controller,
      this.margin,
      this.onSubmitted,
      this.onTap})
      : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  Function(String)? onSubmitted;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: margin ?? getPadding(top: 5, right: 10),
        child: CustomSearchView(
          onSubmitted: onTap,
          width: getHorizontalSize(
            295,
          ),
          height: getVerticalSize(45),
          focusNode: FocusNode(),
          autofocus: false,
          controller: controller,
          hintText: hintText,
          prefix: Container(
            margin: getMargin(
              left: 19,
              top: 9,
              right: 10,
              bottom: 9,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgSearch,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: getVerticalSize(
              33,
            ),
          ),
          suffix: GestureDetector(
            onTap: () {
              Get.bottomSheet(SearchFilterBottomsheet());
            },
            child: Container(
              margin: getMargin(
                left: 30,
                top: 6,
                right: 12,
                bottom: 6,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgSignal,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: getVerticalSize(
              37,
            ),
          ),
        ),
      ),
    );
  }
}
