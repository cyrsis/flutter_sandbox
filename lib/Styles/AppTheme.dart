import 'package:flutter/material.dart';

class AppTheme {
  static final String Title = "MyApps";

  static final ThemeData Apptheme = new ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600]);

  static final ThemeData iosTheme = new ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.grey[400],
      primaryColorBrightness: Brightness.dark,
      accentColor: Colors.grey[600]);

  static final ThemeData androidTheme = new ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.cyan[600]);
}
