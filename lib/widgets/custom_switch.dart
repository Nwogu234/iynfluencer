import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({this.alignment, this.margin, this.value, this.onChanged});

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  bool? value;

  Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  _buildSwitchWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: value ?? false,
        height: getHorizontalSize(20),
        width: getHorizontalSize(46),
        toggleSize: 20,
        borderRadius: getHorizontalSize(
          10.00,
        ),
        activeColor: ColorConstant.cyan30042,
        activeToggleColor: ColorConstant.cyan300,
        inactiveColor: ColorConstant.cyan30042,
        inactiveToggleColor: ColorConstant.cyan300,
        onToggle: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}
