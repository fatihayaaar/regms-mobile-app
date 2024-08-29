import 'package:flutter/material.dart';

import '../app_theme_mode.dart';
import 'abstract/theme_mode_light_interface.dart';
import 'color_scheme_light.dart';

class ThemeModeLight extends AppThemeMode with IThemeModeLight {
  static ThemeModeLight? _instance;

  static ThemeModeLight get instance {
    _instance ??= ThemeModeLight._();
    return _instance!;
  }

  ThemeModeLight._();

  ThemeData get themeData => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: ColorSchemeLight.kBackgroundColor,
        textTheme: textThemeLight.data,
        primaryTextTheme: textThemeLight.dataPrimary,
        appBarTheme: appBarThemeLight.data,
        bottomNavigationBarTheme: bottomNavigationBarThemeLight.data,
        bottomSheetTheme: bottomSheetThemeLight.data,
        drawerTheme: drawerThemeLight.data,
        floatingActionButtonTheme: floatActionButtonThemeLight.data,
        elevatedButtonTheme: elevatedButtonThemeLight.data,
      );
}
