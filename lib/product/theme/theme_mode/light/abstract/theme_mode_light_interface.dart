import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/text_theme_light.dart';

abstract class IThemeModeLight {
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  TextThemeLight textThemeLight = TextThemeLight.instance;
}
