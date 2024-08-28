import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustozButton extends StatelessWidget {
  CustozButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.loading = false,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShapeszz? shape;

  ButtonPaddingzz? padding;

  ButtonVariantzz? variant;

  ButtonFontStylezz? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;
  
  bool loading;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixWidget ?? SizedBox(),
          loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                )
              : Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    text ?? "",
                    textAlign: TextAlign.left,
                    style: _setFontStyle(),
                  ),
              ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return loading
          ? Container(
              width: getVerticalSize(20),
              height: getVerticalSize(20),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                  strokeCap: StrokeCap.round,
                ),
              ),
            )
          : Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPaddingzz.PaddingAll15:
        return getPadding(
          all: 15,
        );
      case ButtonPaddingzz.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case ButtonPaddingzz.PaddingT12:
        return getPadding(
          top: 12,
          right: 12,
          bottom: 12,
        );
      case ButtonPaddingzz.PaddingAll4:
        return getPadding(
          top:3,
          bottom:3,
          right:11,
          left:11
        );
      case ButtonPaddingzz.PaddingT4:
        return getPadding(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case ButtonPaddingzz.PaddingT13:
        return getPadding(
          left: 13,
          top: 13,
          bottom: 13,
        );
      case ButtonPaddingzz.PaddingT8:
        return getPadding(
          top: 8,
          right: 8,
          bottom: 8,
        );
      case ButtonPaddingzz.PaddingT32:
        return getPadding(
          left: 30,
          top: 32,
          right: 32,
          bottom: 32,
        );
      case ButtonPaddingzz.PaddingT52:
        return getPadding(
          left: 12,
          top: 8,
          right: 12,
          bottom: 8,
        );
      default:
        return getPadding(
          all: 7,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariantzz.Neutral:
        return ColorConstant.gray200;
      case ButtonVariantzz.OutlineGray300b2:
        return ColorConstant.whiteA700;
      case ButtonVariantzz.FillLime100b2:
        return ColorConstant.lime100B2;
      case ButtonVariantzz.OutlineIndigo50_1:
        return ColorConstant.whiteA700;
      case ButtonVariantzz.FillCyan30083:
        return ColorConstant.cyan30083;
      case ButtonVariantzz.OutlineIndigo50_2:
        return ColorConstant.whiteA700;
      case ButtonVariantzz.FillGray200ab:
        return ColorConstant.gray200Ab;
      case ButtonVariantzz.FillGray20087:
        return ColorConstant.gray20087;
      case ButtonVariantzz.FillCyan3005e:
        return ColorConstant.cyan3005e;
      case ButtonVariantzz.FillGreenA10099:
        return ColorConstant.greenA10099;
      case ButtonVariantzz.FillRed10099:
        return ColorConstant.red10099;
      case ButtonVariantzz.FillGray20003:
        return ColorConstant.gray20003;
      case ButtonVariantzz.FillRedA700:
        return ColorConstant.redA700;
      case ButtonVariantzz.gray700:
        return ColorConstant.gray100;
      case ButtonVariantzz.FillCyan30066:
        return ColorConstant.cyan30066;
      case ButtonVariantzz.OutlineIndigo50_3:
        return ColorConstant.whiteA700;
      case ButtonVariantzz.OutlineIndigo50:
        return null;
      default:
        return ColorConstant.cyan300;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariantzz.OutlineGray300b2:
        return BorderSide(
          color: ColorConstant.gray300B2,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantzz.OutlineIndigo50_1:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantzz.OutlineIndigo50_2:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantzz.OutlineIndigo50:
        return BorderSide(
          color: ColorConstant.gray600,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantzz.OutlineIndigo50_3:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantzz.FillCyan300:
      case ButtonVariantzz.Neutral:
      case ButtonVariantzz.FillLime100b2:
      case ButtonVariantzz.FillCyan30083:
      case ButtonVariantzz.FillGray200ab:
      case ButtonVariantzz.FillGray20087:
      case ButtonVariantzz.FillCyan3005e:
      case ButtonVariantzz.FillGreenA10099:
      case ButtonVariantzz.FillRed10099:
      case ButtonVariantzz.FillGray20003:
      case ButtonVariantzz.FillRedA700:
      case ButtonVariantzz.FillCyan30066:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariantzz.OutlineIndigo50_2:
        return ColorConstant.gray9000c;
      case ButtonVariantzz.FillCyan300:
      case ButtonVariantzz.Neutral:
      case ButtonVariantzz.OutlineGray300b2:
      case ButtonVariantzz.FillLime100b2:
      case ButtonVariantzz.OutlineIndigo50_1:
      case ButtonVariantzz.FillCyan30083:
      case ButtonVariantzz.FillGray200ab:
      case ButtonVariantzz.FillGray20087:
      case ButtonVariantzz.FillCyan3005e:
      case ButtonVariantzz.FillGreenA10099:
      case ButtonVariantzz.OutlineIndigo50:
      case ButtonVariantzz.FillRed10099:
      case ButtonVariantzz.FillGray20003:
      case ButtonVariantzz.FillRedA700:
      case ButtonVariantzz.FillCyan30066:
      case ButtonVariantzz.OutlineIndigo50_3:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShapeszz.RoundedBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      case ButtonShapeszz.RoundedBorder122:
        return BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        );
      case ButtonShapeszz.RoundedBorder3:
        return BorderRadius.circular(
          getHorizontalSize(
            3.00,
          ),
        );
      case ButtonShapeszz.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            7.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStylezz.SatoshiBold14:
        return TextStyle(
          color: ColorConstant.gray90001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Gray90002:
        return TextStyle(
          color: ColorConstant.gray90002,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Gray100:
        return TextStyle(
          color: ColorConstant.gray100,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiLight14:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStylezz.SatoshiBold115:
        return TextStyle(
          color: ColorConstant.redA600,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold12Gray900ab:
        return TextStyle(
          color: ColorConstant.gray900Ab,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold13:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold15:
        return TextStyle(
          color: ColorConstant.gray100,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold15Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold115Green700:
        return TextStyle(
          color: ColorConstant.green700,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w800,
        );
      case ButtonFontStylezz.SatoshiBold115Red700:
        return TextStyle(
          color:  ColorConstant.redA600,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w800,
        );
      case ButtonFontStylezz.SatoshiBold135:
        return TextStyle(
          color: ColorConstant.gray900B0,
          fontSize: getFontSize(
            13.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
        );
      case ButtonFontStylezz.SatoshiBold115Gray90003:
        return TextStyle(
          color: ColorConstant.gray90003,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold14Gray200:
        return TextStyle(
          color: ColorConstant.gray200,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiLight16:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStylezz.SatoshiBold13WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStylezz.SatoshiBold13White700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShapeszz {
  Square,
  RoundedBorder7,
  RoundedBorder12,
  RoundedBorder3,
  RoundedBorder122
}

enum ButtonPaddingzz {
  PaddingAll15,
  PaddingAll12,
  PaddingT12,
  PaddingAll4,
  PaddingT4,
  PaddingAll7,
  PaddingT13,
  PaddingT8,
  PaddingT32,
  PaddingT52,
}

enum ButtonVariantzz {
  FillCyan300,
  Neutral,
  OutlineGray300b2,
  FillLime100b2,
  OutlineIndigo50_1,
  FillCyan30083,
  OutlineIndigo50_2,
  FillGray200ab,
  FillGray20087,
  FillCyan3005e,
  FillGreenA10099,
  OutlineIndigo50,
  FillRed10099,
  FillGray20003,
  FillRedA700,
  FillCyan30066,
  OutlineIndigo50_3,
  yellow200,
  gray700
}

enum ButtonFontStylezz {
  SatoshiBold14WhiteA700,
  SatoshiBold13White700,
  SatoshiBold14,
  SatoshiBold14Gray90002,
  SatoshiBold14Gray600,
  SatoshiBold14Gray100,
  SatoshiLight14,
  SatoshiBold115,
  SatoshiBold12,
  SatoshiBold12Gray900ab,
  SatoshiBold13,
  SatoshiBold14Gray900,
  SatoshiBold15,
  SatoshiBold15Gray900,
  SatoshiBold115Green700,
  SatoshiBold135,
  SatoshiBold115Gray90003,
  SatoshiBold14Black900,
  SatoshiBold14Gray200,
  SatoshiLight16,
  SatoshiBold13WhiteA700,
  SatoshiBold115Red700
}
