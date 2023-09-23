import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.SatoshiLight14:
        return TextStyle(
          color: ColorConstant.gray600Ab,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.SatoshiBold22:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            22,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case TextFormFieldFontStyle.SatoshiBold10:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case TextFormFieldFontStyle.SatoshiLight14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.SatoshiBold13:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case TextFormFieldFontStyle.SatoshiLight13:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.SatoshiLight20:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
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
      case TextFormFieldShape.CircleBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
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
      case TextFormFieldVariant.Neutral:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillCyan300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillCyan3005e:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.None:
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
      case TextFormFieldVariant.Neutral:
        return ColorConstant.gray200;
      case TextFormFieldVariant.FillCyan300:
        return ColorConstant.cyan300;
      case TextFormFieldVariant.FillCyan3005e:
        return ColorConstant.cyan3005e;
      default:
        return ColorConstant.gray100;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.Neutral:
        return true;
      case TextFormFieldVariant.FillCyan300:
        return true;
      case TextFormFieldVariant.FillCyan3005e:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT14:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingT47:
        return getPadding(
          left: 16,
          top: 47,
          right: 16,
          bottom: 47,
        );
      case TextFormFieldPadding.PaddingT38:
        return getPadding(
          left: 16,
          top: 38,
          right: 16,
          bottom: 38,
        );
      case TextFormFieldPadding.PaddingT11:
        return getPadding(
          left: 11,
          top: 11,
          bottom: 11,
        );
      case TextFormFieldPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      case TextFormFieldPadding.PaddingT9:
        return getPadding(
          top: 9,
          right: 9,
          bottom: 9,
        );
      case TextFormFieldPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder6,
  CircleBorder10,
}
enum TextFormFieldPadding {
  PaddingAll14,
  PaddingT14,
  PaddingT47,
  PaddingT38,
  PaddingT11,
  PaddingAll3,
  PaddingT9,
  PaddingAll9,
}
enum TextFormFieldVariant {
  None,
  FillGray100,
  Neutral,
  FillCyan300,
  FillCyan3005e,
}
enum TextFormFieldFontStyle {
  SatoshiLight14Gray900ab,
  SatoshiLight14,
  SatoshiBold22,
  SatoshiBold10,
  SatoshiLight14Gray600,
  SatoshiBold13,
  SatoshiLight13,
  SatoshiLight20,
}
