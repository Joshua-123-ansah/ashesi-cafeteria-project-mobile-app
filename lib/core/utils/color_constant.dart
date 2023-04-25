import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color red5090 = fromHex('#90ffeded');

  static Color bluegray900 = fromHex('#333333');

  static Color pink900 = fromHex('#630512');
  static Color black900B2 = fromHex('#b2000000');

  static Color gray300 = fromHex('#e8dede');

  static Color whiteA700 = fromHex('#ffffff');

  static Color red50 = fromHex('#ffeded');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
