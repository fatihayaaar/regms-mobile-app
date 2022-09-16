import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/stores/settings/settings_store.dart';

class MyTheme {
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
  );
  var appBarTheme = (base) => AppBarTheme(
        systemOverlayStyle: _getColor(
          value: base,
          lightColor: SystemUiOverlayStyle.dark,
          darkColor: SystemUiOverlayStyle.light,
        ),
        backgroundColor: kAppbarColor,
        titleTextStyle: GoogleFonts.raleway(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      );
  var bottomNavigationBarThemeData = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: kAppbarColor,
  );

  ThemeData buildTheme(SettingStore store) {
    final base = store.darkMode ? ThemeData.dark() : ThemeData.light();
    return base.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme,
      appBarTheme: appBarTheme(base),
      bottomNavigationBarTheme: bottomNavigationBarThemeData,
      backgroundColor: kBackgroundColor,
    );
  }

  static _getColor({value, lightColor, darkColor}) {
    if (value == ThemeData.light()) {
      return lightColor;
    }
    return darkColor;
  }
}
