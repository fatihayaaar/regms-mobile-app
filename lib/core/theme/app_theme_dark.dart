import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  ThemeData? themeData;

  static AppThemeDark instance({ThemeData? themeData}) {
    if (_instance == null) {
      _instance = AppThemeDark._init(themeData: themeData);
    }
    return _instance!;
  }

  AppThemeDark._init({this.themeData});

  ThemeData get theme => themeData ?? ThemeData.dark().copyWith();
}
