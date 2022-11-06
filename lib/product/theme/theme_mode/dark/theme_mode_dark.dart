import 'package:flutter/material.dart';

import '../app_theme_mode.dart';

class ThemeModeDark implements AppThemeMode {
  static ThemeModeDark? _instance;

  static ThemeModeDark get instance {
    _instance ??= ThemeModeDark._();
    return _instance!;
  }

  ThemeModeDark._();

  ThemeData get themeData => ThemeData.dark().copyWith();
}
