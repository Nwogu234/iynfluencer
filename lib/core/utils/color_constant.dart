import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray5001 = fromHex('#fcfcfc');

  static Color gray90099 = fromHex('#99222222');

  static Color gray900Ab = fromHex('#ab222222');

  static Color green700 = fromHex('#3d8352');

  static Color black90087 = fromHex('#87000000');

  static Color gray9000c = fromHex('#0c101828');

  static Color lime100B2 = fromHex('#b2f9e4ca');

  static Color gray20001 = fromHex('#f0f0f0');

  static Color gray20002 = fromHex('#ebebee');

  static Color gray20087 = fromHex('#87efefef');

  static Color redA700 = fromHex('#d80027');

  static Color gray20003 = fromHex('#e9e9eb');

  static Color gray600 = fromHex('#717171');

  static Color cyan30066 = fromHex('#665cc8e0');

  static Color blue900 = fromHex('#0052b4');

  static Color whiteA700C1 = fromHex('#c1ffffff');

  static Color blueGray100 = fromHex('#cfd4dc');

  static Color lime900 = fromHex('#6d3d0a');

  static Color gray200 = fromHex('#efefef');

  static Color black9000c = fromHex('#0c000000');

  static Color blueGray9009e = fromHex('#9e2a2c2e');

  static Color cyan3005e = fromHex('#5e5dc8e0');

  static Color gray200Ab = fromHex('#abefefef');

  static Color blueGray40002 = fromHex('#888888');

  static Color blueGray40001 = fromHex('#7b838b');

  static Color whiteA700 = fromHex('#ffffff');

  static Color greenA10099 = fromHex('#99caf9d2');

  static Color whiteA7005e = fromHex('#5effffff');

  static Color gray600Ab = fromHex('#ab717171');

  static Color whiteA7001e = fromHex('#1effffff');

  static Color blueA700 = fromHex('#005fef');

  static Color blueGray10001 = fromHex('#d0d5dd');

  static Color lightBlueA10011 = fromHex('#1191e6f9');

  static Color red500 = fromHex('#fc4040');

  static Color gray50 = fromHex('#f8f8f8');

  static Color blueGray1007f = fromHex('#7fd9d9d9');

  static Color black900 = fromHex('#000000');

  static Color gray900E5 = fromHex('#e5222222');

  static Color gray900A2 = fromHex('#a2222222');

  static Color gray900A7 = fromHex('#a7222222');

  static Color pink400 = fromHex('#f74f73');

  static Color gray90002 = fromHex('#001c30');

  static Color whiteA700E5 = fromHex('#e5ffffff');

  static Color gray90003 = fromHex('#581515');

  static Color gray500 = fromHex('#93979c');

  static Color blueGray400 = fromHex('#8e8e8e');

  static Color indigo50 = fromHex('#e0e5ed');

  static Color blueGray600 = fromHex('#615e82');

  static Color gray900 = fromHex('#222222');

  static Color gray90001 = fromHex('#001c2f');

  static Color cyan300A9 = fromHex('#a95dc8e0');

  static Color cyan30083 = fromHex('#835dc8e0');

  static Color gray200E5 = fromHex('#e5efefef');

  static Color red10099 = fromHex('#99f9cdca');

  static Color gray100 = fromHex('#f5f5f5');

  static Color cyan30042 = fromHex('#425cc8e0');

  static Color cyan300 = fromHex('#5dc8e0');

  static Color gray900B0 = fromHex('#b0222222');

  static Color whiteA70001 = fromHex('#fdfdfd');

  static Color whiteA70002 = fromHex('#fefefe');

  static Color blueGray900Ab = fromHex('#ab2a2c2e');

  static Color gray300B2 = fromHex('#b2dbdbde');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
