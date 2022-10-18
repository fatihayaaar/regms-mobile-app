class ColorSchemeDark {
  static ColorSchemeDark? _instance;

  static ColorSchemeDark get instance {
    if (_instance == null) {
      _instance = ColorSchemeDark._();
    }
    return _instance!;
  }

  ColorSchemeDark._();
}
