import 'package:flutter/material.dart';
import 'package:zawia/config/themes/palette.dart';


abstract class AppTheme {
  //https://m3.material.io/theme-builder#/custom

  // const ThemeData light = ThemeData.from(colorScheme: colorScheme);

  // const ThemeData dark = ThemeData.from(colorScheme:
  // ColorScheme.fromSeed(seedColor: Color(seedColor)));

//  ThemeData()

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      primaryColor: primaryColorLight);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      primaryColor: primaryColorLight);
}
