import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/app_theme_mode.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/abstract/theme_mode_light_interface.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';

class ThemeModeLight extends AppThemeMode with IThemeModeLight {
  static ThemeModeLight? _instance;

  static ThemeModeLight get instance {
    if (_instance == null) {
      _instance = ThemeModeLight._();
    }
    return _instance!;
  }

  ThemeModeLight._();

  var textTheme = TextTheme(
    headline1: GoogleFonts.raleway(
      color: ColorSchemeLight.kLoginTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
    headline2: GoogleFonts.raleway(
      color: ColorSchemeLight.kLoginTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 33,
    ),
    bodyText1: GoogleFonts.raleway(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(60, 60, 60, 1.0),
    ),
  );

  ThemeData get themeData => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: ColorSchemeLight.kBackgroundColor,
        textTheme: textTheme,
        appBarTheme: appBarThemeLight.data,
        bottomNavigationBarTheme: bottomNavigationBarThemeLight.data,
        bottomSheetTheme: bottomSheetThemeLight.data,
        drawerTheme: drawerThemeLight.data,
        floatingActionButtonTheme: floatActionButtonThemeLight.data,
        elevatedButtonTheme: elevatedButtonThemeLight.data,
      );
}
