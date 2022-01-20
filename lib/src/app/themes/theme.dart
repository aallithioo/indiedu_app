import 'package:flutter/material.dart';
import 'typography.dart';
import 'themedata.dart';

class TookoTheme {
  // Theme data
  static ThemeData kTookoLightThemeData() => kLightThemeData();
  static ThemeData kTookoDarkThemeData() => kDarkThemeData();

  // Text theme
  static TextTheme kTookoLightTextTheme() => kLightText;
  static TextTheme kTookoDarkTextTheme() => kDarkText;
}

final tooko = TookoTheme.kTookoLightThemeData();
