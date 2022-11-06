import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme_light.dart';

class AppBarThemeLight {
  static AppBarThemeLight? _instance;

  static AppBarThemeLight get instance {
    _instance ??= AppBarThemeLight._();
    return _instance!;
  }

  AppBarThemeLight._();

  AppBarTheme get data => AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: ColorSchemeLight.kThemeColor,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
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
        iconTheme: const IconThemeData(color: Colors.white),
      );
}
