import 'package:flutter/material.dart';
import 'package:tracker/contants/palette.dart';

class ThemeApp {
  ThemeApp._();

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true);
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
}

class TextThemeData {
  static const TextStyle displayLarge = TextStyle(
      fontSize: 25,
      fontFamily: 'RobotoBlack',
      fontWeight: FontWeight.w900,
      color: Palette.primaryHeadlineColor);

  static const TextStyle displayBold = TextStyle(
      fontSize: 22,
      fontFamily: 'RobotoBold',
      fontWeight: FontWeight.w700,
      color: Palette.primaryHeadlineColor);

  static const TextStyle displayRegular = TextStyle(
      fontSize: 18, fontFamily: 'Roboto', color: Palette.primaryHeadlineColor);

  static const TextStyle displaySmall = TextStyle(
      fontSize: 16,
      fontFamily: 'RobotoLight',
      color: Palette.primaryHeadlineColor);

  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: displayLarge,
      headlineLarge: displayBold,
      displayMedium: displayRegular,
      displaySmall: displaySmall,
    );
  }
}
