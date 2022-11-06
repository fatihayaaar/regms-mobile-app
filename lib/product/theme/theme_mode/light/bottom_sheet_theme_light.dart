import 'package:flutter/material.dart';

class BottomSheetThemeLight {
  static BottomSheetThemeLight? _instance;

  static BottomSheetThemeLight get instance {
    _instance ??= BottomSheetThemeLight._();
    return _instance!;
  }

  BottomSheetThemeLight._();

  BottomSheetThemeData get data => const BottomSheetThemeData(
        backgroundColor: Colors.white,
      );
}
