import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme_light.dart';

class TextThemeLight {
  static TextThemeLight? _instance;

  static TextThemeLight get instance {
    _instance ??= TextThemeLight._();
    return _instance!;
  }

  TextThemeLight._();

  TextStyle? displayLarge = GoogleFonts.rubik(
    color: ColorSchemeLight.kThemeColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  //TextStyle? displayMedium = TextStyle();
  TextStyle? displaySmall = GoogleFonts.rubik(
    color: ColorSchemeLight.kThemeColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextStyle? headlineLarge = GoogleFonts.raleway(
    color: ColorSchemeLight.kLoginTitleColor,
    fontWeight: FontWeight.bold,
    fontSize: 48,
  );
  TextStyle? headlineMedium = GoogleFonts.raleway(
    color: ColorSchemeLight.kLoginTitleColor,
    fontWeight: FontWeight.bold,
    fontSize: 33,
  );
  TextStyle? headlineSmall = GoogleFonts.raleway(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );

  //TextStyle? titleLarge = TextStyle();
  TextStyle? titleMedium = GoogleFonts.rubik(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: ColorSchemeLight.kUsernameColor,
  );
  TextStyle? titleSmall = GoogleFonts.rubik(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ColorSchemeLight.kThemeColor,
  );

  //TextStyle? bodyLarge = TextStyle();
  TextStyle? bodyMedium = GoogleFonts.raleway(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 19,
  );
  TextStyle? bodySmall = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorSchemeLight.kTextBioColor,
  );

  //TextStyle? labelLarge = TextStyle();
  TextStyle? labelSmall = GoogleFonts.raleway(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: ColorSchemeLight.kButtonContentTextColor,
  );

  TextTheme get data => TextTheme(
        //displayLarge: displayLarge,
        //displayMedium: displayMedium,
        displaySmall: displaySmall,

        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,

        //titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,

        //bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        //bodySmall: bodySmall,

        //labelLarge: labelLarge,
        //labelMedium: ,
        labelSmall: labelSmall,
      );

  TextTheme get dataPrimary => const TextTheme();
}
