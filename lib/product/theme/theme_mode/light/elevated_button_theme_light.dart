import 'package:flutter/material.dart';

class ElevatedButtonThemeLight {
  static ElevatedButtonThemeLight? _instance;

  static ElevatedButtonThemeLight get instance {
    _instance ??= ElevatedButtonThemeLight._();
    return _instance!;
  }

  ElevatedButtonThemeLight._();

  ElevatedButtonThemeData get data => const ElevatedButtonThemeData(
        style: ButtonStyle(),
      );
}
