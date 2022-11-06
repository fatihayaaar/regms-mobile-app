import 'theme_mode/dark/theme_mode_dark.dart';
import 'theme_mode/light/theme_mode_light.dart';

class AppThemeData {
  static AppThemeData? _instance;
  late final ThemeModeLight themeModeLight;
  late final ThemeModeDark themeModeDark;

  static AppThemeData get instance {
    _instance ??= AppThemeData._();
    return _instance!;
  }

  AppThemeData._() {
    themeModeLight = ThemeModeLight.instance;
    themeModeDark = ThemeModeDark.instance;
  }
}
