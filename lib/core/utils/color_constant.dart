import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray400 = fromHex('#c4c4c4');

  static Color gray500 = fromHex('#969393');

  static Color blueGray400 = fromHex('#8f8e8e');

  static Color red800 = fromHex('#c92525');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#fdfafa');

  static Color redA7003a = fromHex('#3afd0b0b');

  static Color gray100 = fromHex('#faf5f5');

  static Color redA200F4 = fromHex('#f4ff6262');

  static Color black900 = fromHex('#000000');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color redA700 = fromHex('#ff0000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
