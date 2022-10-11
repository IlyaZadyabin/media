import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

abstract class CoreStyles {
  static const Color black = Color(0xFF444444);
  static const Color veryBlack = Color(0xFF111111);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9C9C9C);
  static const Color darkGrey = Color(0xFF656565);
  static const Color lightGrey = Color(0xFFF0F2F5);
  static const Color red = Color(0xFFEC4E27);
  static const Color blue = Color(0xFF87C6F5);

  static const String fontName = 'Matter';
  static TextStyle defaultTextStyle = const TextStyle(
    fontFamily: fontName,
    color: CoreStyles.black,
  );

  static TextTheme textTheme = TextTheme(
    headline3: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline4: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    headline5: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headline6: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    subtitle1: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 10,
    ),
    subtitle2: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    bodyText1: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    bodyText2: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    caption: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
