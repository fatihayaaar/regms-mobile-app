import 'package:flutter/material.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';

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
