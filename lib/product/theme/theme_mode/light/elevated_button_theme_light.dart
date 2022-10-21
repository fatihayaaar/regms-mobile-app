import 'package:flutter/material.dart';

class ElevatedButtonThemeLight {
  static ElevatedButtonThemeLight? _instance;

  static ElevatedButtonThemeLight get instance {
    if (_instance == null) {
      _instance = ElevatedButtonThemeLight._();
    }
    return _instance!;
  }

  ElevatedButtonThemeLight._();

  ElevatedButtonThemeData get data => ElevatedButtonThemeData(
        style: ButtonStyle(),
      );
}
