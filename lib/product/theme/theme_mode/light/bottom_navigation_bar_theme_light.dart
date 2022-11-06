import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class BottomNavigationBarThemeLight {
  static BottomNavigationBarThemeLight? _instance;

  static BottomNavigationBarThemeLight get instance {
    _instance ??= BottomNavigationBarThemeLight._();
    return _instance!;
  }

  BottomNavigationBarThemeLight._();

  BottomNavigationBarThemeData get data => const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: ColorSchemeLight.kThemeColor,
      );
}
