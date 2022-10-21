class BottomSheetThemeLight {
  static BottomSheetThemeLight? _instance;

  static BottomSheetThemeLight get instance {
    if (_instance == null) {
      _instance = BottomSheetThemeLight._();
    }
    return _instance!;
  }

  BottomSheetThemeLight._();
}
