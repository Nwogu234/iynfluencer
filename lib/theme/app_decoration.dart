import 'package:flutter/material.dart';
import 'package:iynfluencer/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtFillRed500 => BoxDecoration(
        color: ColorConstant.red500,
      );
  static BoxDecoration get neutral => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get outlineGray20003 => BoxDecoration(
        color: ColorConstant.gray20003,
        border: Border.all(
          color: ColorConstant.gray20003,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: strokeAlignCenter,
        ),
      );
  static BoxDecoration get fillGray90001 => BoxDecoration(
        color: ColorConstant.gray90001,
      );
  static BoxDecoration get txtFillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineIndigo50 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineGray20002 => BoxDecoration(
        color: ColorConstant.gray100,
        border: Border.all(
          color: ColorConstant.gray20002,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000c,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              1,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineCyan300 => BoxDecoration(
        color: ColorConstant.cyan300,
        border: Border.all(
          color: ColorConstant.cyan300,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: strokeAlignCenter,
        ),
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillWhiteA70001 => BoxDecoration(
        color: ColorConstant.whiteA70001,
      );
  static BoxDecoration get txtFillCyan300 => BoxDecoration(
        color: ColorConstant.cyan300,
      );
  static BoxDecoration get fillWhiteA70002 => BoxDecoration(
        color: ColorConstant.whiteA70002,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineIndigo505 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border(
          top: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineIndigo504 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: strokeAlignOutside,
        ),
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
              -1,
              3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineIndigo507 => BoxDecoration(
        color: ColorConstant.whiteA700E5,
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineIndigo506 => BoxDecoration(
        color: ColorConstant.lightBlueA10011,
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineIndigo501 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineIndigo503 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineIndigo502 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get fillRedA700 => BoxDecoration(
        color: ColorConstant.redA700,
      );
  static BoxDecoration get outlineGray9000c => BoxDecoration(
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
              -1,
              3,
            ),
          ),
        ],
      );
  static BoxDecoration get txtFillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillGray20001 => BoxDecoration(
        color: ColorConstant.gray20001,
      );
  static BoxDecoration get outlineIndigo509 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
          bottom: BorderSide(
            color: ColorConstant.indigo50,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get txtNeutral => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get outlineIndigo508 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: ColorConstant.gray5001,
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL6 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );

  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
  );

  static BorderRadius customBorderTL6 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );

  static BorderRadius customBorderTL15 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        15,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        15,
      ),
    ),
  );

  static BorderRadius circleBorder7 = BorderRadius.circular(
    getHorizontalSize(
      7,
    ),
  );

  static BorderRadius circleBorder27 = BorderRadius.circular(
    getHorizontalSize(
      27,
    ),
  );

  static BorderRadius circleBorder45 = BorderRadius.circular(
    getHorizontalSize(
      45,
    ),
  );

  static BorderRadius roundedBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17,
    ),
  );

  static BorderRadius roundedBorder35 = BorderRadius.circular(
    getHorizontalSize(
      35,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius txtRoundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6,
    ),
  );

  static BorderRadius roundedBorder42 = BorderRadius.circular(
    getHorizontalSize(
      42,
    ),
  );

  static BorderRadius txtCircleBorder11 = BorderRadius.circular(
    getHorizontalSize(
      11,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    