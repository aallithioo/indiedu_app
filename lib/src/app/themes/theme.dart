import 'package:flutter/material.dart';
import 'typography.dart';
import 'themedata.dart';

class IndieduTheme {
  // Theme data
  static ThemeData kIndieduLightThemeData() => kLightThemeData();
  static ThemeData kIndieduDarkThemeData() => kDarkThemeData();

  // Text theme
  static TextTheme kIndieduLightTextTheme() => kLightText;
  static TextTheme kIndieduDarkTextTheme() => kDarkText;
}

final indiedu = IndieduTheme.kIndieduLightThemeData();
