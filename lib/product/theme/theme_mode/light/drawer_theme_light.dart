class DrawerThemeLight {
  static DrawerThemeLight? _instance;

  static DrawerThemeLight get instance {
    if (_instance == null) {
      _instance = DrawerThemeLight._();
    }
    return _instance!;
  }

  DrawerThemeLight._();
}
