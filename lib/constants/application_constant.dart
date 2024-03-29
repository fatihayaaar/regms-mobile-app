// ignore_for_file: constant_identifier_names

import '../core/theme/enum/theme_name.dart';

class ApplicationConstant {
  static const String DEFAULT_LANGUAGE = 'en';
  static const List<String> LANGUAGE_SUPPORT = ['en', 'tr'];
  static const ThemeName DEFAULT_THEME = ThemeName.LIGHT;
  static const List<ThemeName> THEME_SUPPORT = [ThemeName.LIGHT, ThemeName.DARK];
  static const String API_URL = 'http://localhost.com';
}
