class BottomNavigationBarThemeLight {
  static BottomNavigationBarThemeLight? _instance;

  static BottomNavigationBarThemeLight get instance {
    if (_instance == null) {
      _instance = BottomNavigationBarThemeLight._();
    }
    return _instance!;
  }

  BottomNavigationBarThemeLight._();
}
