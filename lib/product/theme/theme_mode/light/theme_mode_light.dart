import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/text_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/app_theme_mode.dart';

class ThemeModeLight implements AppThemeMode {
  TextThemeLight? textThemeLight;

  var textTheme = TextTheme(
    headline1: GoogleFonts.raleway(
      color: kLoginTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
    headline2: GoogleFonts.raleway(
      color: kLoginTitleColor,
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
    backgroundColor: kThemeColor,
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
    unselectedItemColor: kThemeColor,
  );
  var bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: Colors.white,
  );
  var drawerThemeData = DrawerThemeData(
    backgroundColor: kBackgroundColor,
  );
  var elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(),
  );
  var floatActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: kThemeColor,
  );

  ThemeData get themeData => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: kBackgroundColor,
        textTheme: textTheme,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        bottomSheetTheme: bottomSheetThemeData,
        drawerTheme: drawerThemeData,
        floatingActionButtonTheme: floatActionButtonThemeData,
        elevatedButtonTheme: elevatedButtonThemeData,
      );
}
