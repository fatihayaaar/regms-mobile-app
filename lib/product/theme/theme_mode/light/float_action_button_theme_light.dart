import 'package:flutter/material.dart';

import 'color_scheme_light.dart';

class FloatActionButtonThemeLight {
  static FloatActionButtonThemeLight? _instance;

  static FloatActionButtonThemeLight get instance {
    _instance ??= FloatActionButtonThemeLight._();
    return _instance!;
  }

  FloatActionButtonThemeLight._();

  FloatingActionButtonThemeData get data => const FloatingActionButtonThemeData(
        backgroundColor: ColorSchemeLight.kThemeColor,
      );
}
