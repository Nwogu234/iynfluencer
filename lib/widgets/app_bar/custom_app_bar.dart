import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadowGray9000c:
        return Container(
          height: getVerticalSize(
            57,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            boxShadow: [
              BoxShadow(
                color: ColorConstant.gray9000c,
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: Offset(
                  0,
                  1,
                ),
              ),
            ],
          ),
        );
      case Style.bgOutlineIndigo50:
        return Container(
          height: getVerticalSize(
            63,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorConstant.indigo50,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
          ),
        );
      case Style.bgOutlineIndigo50_1:
        return Container(
          height: getVerticalSize(
            48,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            border: Border(
              bottom: BorderSide(
                color: ColorConstant.indigo50,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadowGray9000c,
  bgOutlineIndigo50,
  bgOutlineIndigo50_1,
}
