import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/theme/app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    if (_instance == null) {
      _instance = AppThemeDark._init();
    }
    return _instance!;
  }

  AppThemeDark._init();

  ThemeData get theme => ThemeData.dark().copyWith();
}
