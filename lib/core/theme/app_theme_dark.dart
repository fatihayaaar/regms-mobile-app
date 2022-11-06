import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  ThemeData? themeData;

  static AppThemeDark instance({ThemeData? themeData}) {
    _instance ??= AppThemeDark._init(themeData: themeData);
    return _instance!;
  }

  AppThemeDark._init({this.themeData});

  @override
  ThemeData get theme => themeData ?? ThemeData.dark().copyWith();
}
