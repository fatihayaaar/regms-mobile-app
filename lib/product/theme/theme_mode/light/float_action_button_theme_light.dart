import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class FloatActionButtonThemeLight {
  static FloatActionButtonThemeLight? _instance;

  static FloatActionButtonThemeLight get instance {
    if (_instance == null) {
      _instance = FloatActionButtonThemeLight._();
    }
    return _instance!;
  }

  FloatActionButtonThemeLight._();

  FloatingActionButtonThemeData get data => FloatingActionButtonThemeData(
        backgroundColor: ColorSchemeLight.kThemeColor,
      );
}
