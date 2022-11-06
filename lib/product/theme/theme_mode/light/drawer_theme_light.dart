import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class DrawerThemeLight {
  static DrawerThemeLight? _instance;

  static DrawerThemeLight get instance {
    _instance ??= DrawerThemeLight._();
    return _instance!;
  }

  DrawerThemeLight._();

  DrawerThemeData get data => const DrawerThemeData(
        backgroundColor: ColorSchemeLight.kBackgroundColor,
      );
}
