import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustoDropDown extends StatelessWidget {

  CustoDropDown(
      {this.padding,
        this.shape,
        this.variant,
        this.fontStyle,
        this.alignment,
        this.width,
        this.margin,
        this.focusNode,
        this.autofocus = false,
        this.icon,
        this.hintText,
        this.prefix,
        this.prefixConstraints,
        required this.items,
        this.onChanged,
        this.validator,
        required this.value,
        this.onTap,
      });

  DropDownPadding? padding;

  DropDownShape? shape;

  DropDownVariants? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  SelectionPopupModel value;

  FocusNode? focusNode;

  bool? autofocus;

  Widget? icon;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  RxList<SelectionPopupModel> items;

  Function(SelectionPopupModel)? onChanged;
  final VoidCallback? onTap;

  FormFieldValidator<SelectionPopupModel>? validator;
  List<SelectionPopupModel> itemsToDisplay=[];


  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildDropDownWidget(),
    )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {


// If the currently selected item is in the select                                                                                                                                                                                                                                                                     edItems list, set it to null or to another existing item.



    return GestureDetector(

      child: Container(
        width: width ?? double.maxFinite,
        // margin: margin,
        child: InputDecorator(
          decoration: _buildDecoration(),
          child: DropdownButton<SelectionPopupModel>(
            underline: Container(),
            focusNode: focusNode,
            autofocus: autofocus!,
            isExpanded: true,
            icon: null,
            value: value,
            style: _setFontStyle(),
            // decoration: _buildDecoration(),
            items: items.value.map((SelectionPopupModel item) {
              return DropdownMenuItem<SelectionPopupModel>(
                value: item,
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              if(newValue != null) {
                onChanged!(newValue);
              }
            },
            // validator: validator,
          ),
        ),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      // Customize the decoration here
        hintText: hintText ?? "",
        hintStyle: _setFontStyle(),
        border: _setBorderStyle(),
        enabledBorder: _setBorderStyle(),
        focusedBorder: _setBorderStyle(),
        prefixIconConstraints: prefixConstraints,
        fillColor: _setFillColor(),
        filled: _setFilled(),
        isDense: true,
        contentPadding: EdgeInsets.all(5.0)
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case DropDownFontStyle.SatoshiLight14:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case DropDownFontStyle.SatoshiBold135:
        return TextStyle(
          color: ColorConstant.gray900B0,
          fontSize: getFontSize(
            13.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case DropDownVariants.OutlineIndigo50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo50,
            width: 1,
          ),
        );
      case DropDownVariants.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return ColorConstant.gray200;
    }
  }

  _setFilled() {
    switch (variant) {
      case DropDownVariants.OutlineIndigo50:
        return false;
      case DropDownVariants.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case DropDownPadding.PaddingT8:
        return getPadding(
          top: 8,
          right: 8,
          bottom: 8,
        );
      default:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
    }
  }
}

enum DropDownPadding {
  PaddingT14,
  PaddingT8,
}
enum DropDownShape {
  RoundedBorder6,
}
enum DropDownVariants {
  None,
  Neutral,
  OutlineIndigo50,
}
enum DropDownFontStyle {
  SatoshiLight14Gray900,
  SatoshiLight14,
  SatoshiBold135,
}