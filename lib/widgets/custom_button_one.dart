import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class CustomButtonOne extends StatelessWidget {
  CustomButtonOne(
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

  ButtonShape? shape;

  ButtonPaddings? padding;

  ButtonVariants? variant;

  ButtonFontStyles? fontStyle;

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                )
              : Text(
                  text ?? "",
                  textAlign: TextAlign.center,
                  style: _setFontStyle(),
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
      case ButtonPaddings.PaddingAll156:
        return getPadding(
          all: 15,
        );
      case ButtonPaddings.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case ButtonPaddings.PaddingT12:
        return getPadding(
          top: 12,
          right: 12,
          bottom: 12,
        );
      case ButtonPaddings.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case ButtonPaddings.PaddingT4:
        return getPadding(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case ButtonPaddings.PaddingT13:
        return getPadding(
          left: 13,
          top: 13,
          bottom: 13,
        );
      case ButtonPaddings.PaddingT8:
        return getPadding(
          top: 8,
          right: 8,
          bottom: 8,
        );
      case ButtonPaddings.PaddingT32:
        return getPadding(
          left: 30,
          top: 32,
          right: 32,
          bottom: 32,
        );
      default:
        return getPadding(
          all: 7,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariants.Neutral:
        return ColorConstant.gray200;
      case ButtonVariants.Pink:
        return ColorConstant.pink;
      case ButtonVariants.OutlineGray300b2:
        return ColorConstant.whiteA700;
      case ButtonVariants.FillLime100b2:
        return ColorConstant.lime100B2;
      case ButtonVariants.OutlineIndigo50_1:
        return ColorConstant.whiteA700;
      case ButtonVariants.FillCyan30083:
        return ColorConstant.cyan30083;
      case ButtonVariants.OutlineIndigo50_2:
        return ColorConstant.whiteA700;
      case ButtonVariants.FillGray200ab:
        return ColorConstant.gray200Ab;
      case ButtonVariants.FillGray20087:
        return ColorConstant.gray20087;
      case ButtonVariants.FillCyan3005e:
        return ColorConstant.cyan3005e;
      case ButtonVariants.FillGreenA10099:
        return ColorConstant.greenA10099;
      case ButtonVariants.FillRed10099:
        return ColorConstant.red10099;
      case ButtonVariants.FillGray20003:
        return ColorConstant.gray20003;
      case ButtonVariants.FillRedA700:
        return ColorConstant.redA700;
      case ButtonVariants.FillCyan30066:
        return ColorConstant.cyan30066;
      case ButtonVariants.OutlineIndigo50_3:
        return ColorConstant.whiteA700;
      case ButtonVariants.OutlineIndigo50:
        return null;
      default:
        return ColorConstant.cyan100;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariants.OutlineGray300b2:
        return BorderSide(
          color: ColorConstant.gray300B2,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariants.OutlineIndigo50_1:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariants.OutlineIndigo50_2:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariants.OutlineIndigo50:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariants.OutlineIndigo50_3:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariants.FillCyan300:
      case ButtonVariants.Neutral:
      case ButtonVariants.FillLime100b2:
      case ButtonVariants.FillCyan30083:
      case ButtonVariants.FillGray200ab:
      case ButtonVariants.FillGray20087:
      case ButtonVariants.FillCyan3005e:
      case ButtonVariants.FillGreenA10099:
      case ButtonVariants.FillRed10099:
      case ButtonVariants.FillGray20003:
      case ButtonVariants.FillRedA700:
      case ButtonVariants.FillCyan30066:
      case ButtonVariants.Pink:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariants.OutlineIndigo50_2:
        return ColorConstant.gray9000c;
      case ButtonVariants.FillCyan300:
      case ButtonVariants.Neutral:
      case ButtonVariants.OutlineGray300b2:
      case ButtonVariants.FillLime100b2:
      case ButtonVariants.OutlineIndigo50_1:
      case ButtonVariants.FillCyan30083:
      case ButtonVariants.FillGray200ab:
      case ButtonVariants.FillGray20087:
      case ButtonVariants.FillCyan3005e:
      case ButtonVariants.FillGreenA10099:
      case ButtonVariants.OutlineIndigo50:
      case ButtonVariants.FillRed10099:
      case ButtonVariants.FillGray20003:
      case ButtonVariants.FillRedA700:
      case ButtonVariants.FillCyan30066:
      case ButtonVariants.OutlineIndigo50_3:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case ButtonShape.RoundedBorder3:
        return BorderRadius.circular(
          getHorizontalSize(
            3.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyles.SatoshiBold14:
        return TextStyle(
          color: ColorConstant.gray90001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Gray90002:
        return TextStyle(
          color: ColorConstant.gray90002,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Gray100:
        return TextStyle(
          color: ColorConstant.gray100,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiLight14:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyles.SatoshiBold115:
        return TextStyle(
          color: ColorConstant.lime900,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold12Gray900ab:
        return TextStyle(
          color: ColorConstant.gray900Ab,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold13:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold156:
        return TextStyle(
          color: ColorConstant.gray100,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold15Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold115Green700:
        return TextStyle(
          color: ColorConstant.green700,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold135:
        return TextStyle(
          color: ColorConstant.gray900B0,
          fontSize: getFontSize(
            13.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold115Gray90003:
        return TextStyle(
          color: ColorConstant.gray90003,
          fontSize: getFontSize(
            11.5,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiBold14Gray200:
        return TextStyle(
          color: ColorConstant.gray200,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyles.SatoshiLight16:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        );
      case ButtonFontStyles.SatoshiBold13WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13,
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

enum ButtonShape {
  Square,
  RoundedBorder7,
  RoundedBorder12,
  RoundedBorder3,
}

enum ButtonPaddings {
  PaddingAll15,
  PaddingAll12,
  PaddingT12,
  PaddingAll4,
  PaddingT4,
  PaddingAll7,
  PaddingT13,
  PaddingT8,
  PaddingT32,
  PaddingAll156
}

enum ButtonVariants {
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
  yellow200, Pink
}

enum ButtonFontStyles {
  SatoshiBold14WhiteA700,
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
  SatoshiBold156,
  SatoshiBold15Gray900,
  SatoshiBold115Green700,
  SatoshiBold135,
  SatoshiBold115Gray90003,
  SatoshiBold14Black900,
  SatoshiBold14Gray200,
  SatoshiLight16,
  SatoshiBold13WhiteA700,
}
