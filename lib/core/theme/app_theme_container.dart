import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'app_theme_dark.dart';
import 'app_theme_light.dart';
import 'enum/theme_name.dart';

class AppThemeContainer {
  static AppThemeContainer? _instance;
  static AppThemeContainer get instance {
    _instance ??= AppThemeContainer._init();
    return _instance!;
  }

  AppThemeContainer._init();

  AppTheme getAppTheme({required ThemeName theme, Map<ThemeName, ThemeData>? themeData, required}) {
    switch (theme) {
      case ThemeName.LIGHT:
        return AppThemeLight.instance(themeData: themeData?[ThemeName.LIGHT]);
      case ThemeName.DARK:
        return AppThemeDark.instance(themeData: themeData?[ThemeName.DARK]);
      default:
        return AppThemeLight.instance(themeData: themeData?[ThemeName.LIGHT]);
    }
  }
}
