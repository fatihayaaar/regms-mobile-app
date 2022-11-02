import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  ThemeData? themeData;

  static AppThemeLight instance({ThemeData? themeData}) {
    if (_instance == null) {
      _instance = AppThemeLight._init(themeData: themeData);
    }
    return _instance!;
  }

  AppThemeLight._init({this.themeData});

  ThemeData get theme => themeData ?? ThemeData.light().copyWith();
}
