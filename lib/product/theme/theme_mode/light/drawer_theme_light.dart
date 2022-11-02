import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class DrawerThemeLight {
  static DrawerThemeLight? _instance;

  static DrawerThemeLight get instance {
    if (_instance == null) {
      _instance = DrawerThemeLight._();
    }
    return _instance!;
  }

  DrawerThemeLight._();

  DrawerThemeData get data => DrawerThemeData(
        backgroundColor: ColorSchemeLight.kBackgroundColor,
      );
}
