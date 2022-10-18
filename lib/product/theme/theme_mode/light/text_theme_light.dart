class TextThemeLight {
  static TextThemeLight? _instance;

  static TextThemeLight get instance {
    if (_instance == null) {
      _instance = TextThemeLight._();
    }
    return _instance!;
  }

  TextThemeLight._();
}
