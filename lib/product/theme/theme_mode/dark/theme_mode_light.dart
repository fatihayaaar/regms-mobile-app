import 'package:flutter/material.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/app_theme_mode.dart';

class ThemeModeDark implements AppThemeMode {
  ThemeData get themeData => ThemeData.dark().copyWith();
}
