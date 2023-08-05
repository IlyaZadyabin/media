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
    displaySmall: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headlineMedium: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    headlineSmall: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    titleLarge: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    titleMedium: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 10,
    ),
    titleSmall: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    bodyLarge: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    bodyMedium: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: defaultTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
