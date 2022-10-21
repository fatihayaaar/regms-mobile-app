class AppBarThemeLight {
  static AppBarThemeLight? _instance;

  static AppBarThemeLight get instance {
    if (_instance == null) {
      _instance = AppBarThemeLight._();
    }
    return _instance!;
  }

  AppBarThemeLight._();
}
