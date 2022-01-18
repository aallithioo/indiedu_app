import 'package:flutter/material.dart';
import 'typography.dart';
import 'themedata.dart';

class CharcoTheme {
  // Theme data
  static ThemeData kCharcoLightThemeData() => kLightThemeData();
  static ThemeData kCharcoDarkThemeData() => kDarkThemeData();

  // Text theme
  static TextTheme kCharcoLightTextTheme() => kLightText;
  static TextTheme kCharcoDarkTextTheme() => kDarkText;
}

final charco = CharcoTheme.kCharcoLightThemeData();
