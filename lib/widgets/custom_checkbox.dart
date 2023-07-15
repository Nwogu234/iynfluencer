import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox(
      {this.alignment,
      this.isRightCheck = false,
      this.iconSize,
      this.value,
      this.onChange,
      this.text,
      this.width,
      this.margin});

  Alignment? alignment;

  bool? isRightCheck;

  double? iconSize;

  bool? value;

  Function(bool)? onChange;

  String? text;

  double? width;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildCheckboxWidget(),
          )
        : _buildCheckboxWidget();
  }

  _buildCheckboxWidget() {
    return InkWell(
      onTap: () {
        value = !(value!);
        onChange!(value!);
      },
      child: Container(
        width: width,
        margin: margin ?? EdgeInsets.zero,
        child: isRightCheck! ? getRightSideCheckbox() : getLeftSideCheckbox(),
      ),
    );
  }

  Widget getRightSideCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 8,
          ),
          child: getTextWidget(),
        ),
        getCheckboxWidget(),
      ],
    );
  }

  Widget getLeftSideCheckbox() {
    return Row(
      children: [
        getCheckboxWidget(),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: getTextWidget(),
        ),
      ],
    );
  }

  Widget getTextWidget() {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
    );
  }

  Widget getCheckboxWidget() {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Checkbox(
        value: value ?? false,
        onChanged: (value) {
          onChange!(value!);
        },
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }
}
