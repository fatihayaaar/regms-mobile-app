import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class BottomNavigationBarThemeLight {
  static BottomNavigationBarThemeLight? _instance;

  static BottomNavigationBarThemeLight get instance {
    if (_instance == null) {
      _instance = BottomNavigationBarThemeLight._();
    }
    return _instance!;
  }

  BottomNavigationBarThemeLight._();

  BottomNavigationBarThemeData get data => BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: ColorSchemeLight.kThemeColor,
      );
}
