import 'package:flutter/material.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/app_theme_mode.dart';

class ThemeModeDark implements AppThemeMode {
  static ThemeModeDark? _instance;

  static ThemeModeDark get instance {
    if (_instance == null) {
      _instance = ThemeModeDark._();
    }
    return _instance!;
  }

  ThemeModeDark._();

  ThemeData get themeData => ThemeData.dark().copyWith();
}
