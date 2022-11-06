class ColorSchemeDark {
  static ColorSchemeDark? _instance;

  static ColorSchemeDark get instance {
    _instance ??= ColorSchemeDark._();
    return _instance!;
  }

  ColorSchemeDark._();
}
