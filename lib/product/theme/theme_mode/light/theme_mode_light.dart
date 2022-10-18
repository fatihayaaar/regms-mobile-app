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
  var appBarTheme = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: ColorSchemeLight.kThemeColor,
    titleTextStyle: GoogleFonts.raleway(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 19,
    ),
    toolbarTextStyle: GoogleFonts.raleway(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 19,
    ),
  );
  var bottomNavigationBarThemeData = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: ColorSchemeLight.kThemeColor,
  );
  var bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: Colors.white,
  );
  var drawerThemeData = DrawerThemeData(
    backgroundColor: ColorSchemeLight.kBackgroundColor,
  );
  var elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(),
  );
  var floatActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: ColorSchemeLight.kThemeColor,
  );

  ThemeData get themeData => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: ColorSchemeLight.kBackgroundColor,
        textTheme: textTheme,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        bottomSheetTheme: bottomSheetThemeData,
        drawerTheme: drawerThemeData,
        floatingActionButtonTheme: floatActionButtonThemeData,
        elevatedButtonTheme: elevatedButtonThemeData,
      );
}
