import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/stores/settings/settings_store.dart';
import 'package:regms_flutter_client/core/theme/app_theme.dart';
import 'package:regms_flutter_client/core/theme/app_theme_dark.dart';
import 'package:regms_flutter_client/core/theme/app_theme_light.dart';
import 'package:regms_flutter_client/core/theme/enum/theme_name.dart';

class AppThemeContainer {
  static AppThemeContainer? _instance;
  static AppThemeContainer get instance {
    if (_instance == null) {
      _instance = AppThemeContainer._init();
    }
    return _instance!;
  }

  AppThemeContainer._init();

  AppTheme getAppTheme(SettingStore store) {
    final base = store.darkMode ? ThemeName.DARK : ThemeName.LIGHT;

    switch (base) {
      case ThemeName.LIGHT:
        return AppThemeLight.instance;
      case ThemeName.DARK:
        return AppThemeDark.instance;
      default:
        return AppThemeLight.instance;
    }
  }
}
