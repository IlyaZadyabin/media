import 'package:flutter/material.dart';

abstract class CoreStyles {
  static const Color black = Color(0xFF444444);
  static const Color veryBlack = Color(0xFF111111);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9C9C9C);
  static const Color red = Color(0xFFEC4E27);
  static const Color blue = Color(0xFF87C6F5);

  static const String fontName = 'Matter';
  static TextStyle defaultTextStyle = const TextStyle(fontFamily: fontName);

  static TextTheme textTheme = TextTheme(
    headline5: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    subtitle1: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    subtitle2: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    bodyText1: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );
}
