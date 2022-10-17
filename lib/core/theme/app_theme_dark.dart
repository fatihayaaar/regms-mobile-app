import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

  var appBarTheme = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.amber,
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

  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: appBarTheme,
      );
}
