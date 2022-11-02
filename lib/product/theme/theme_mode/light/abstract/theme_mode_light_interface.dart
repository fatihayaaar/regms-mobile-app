import '../app_bar_theme_light.dart';
import '../bottom_navigation_bar_theme_light.dart';
import '../bottom_sheet_theme_light.dart';
import '../color_scheme_light.dart';
import '../drawer_theme_light.dart';
import '../elevated_button_theme_light.dart';
import '../float_action_button_theme_light.dart';
import '../text_theme_light.dart';

abstract class IThemeModeLight {
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  TextThemeLight textThemeLight = TextThemeLight.instance;
  AppBarThemeLight appBarThemeLight = AppBarThemeLight.instance;
  BottomNavigationBarThemeLight bottomNavigationBarThemeLight =
      BottomNavigationBarThemeLight.instance;
  BottomSheetThemeLight bottomSheetThemeLight = BottomSheetThemeLight.instance;
  DrawerThemeLight drawerThemeLight = DrawerThemeLight.instance;
  ElevatedButtonThemeLight elevatedButtonThemeLight =
      ElevatedButtonThemeLight.instance;
  FloatActionButtonThemeLight floatActionButtonThemeLight =
      FloatActionButtonThemeLight.instance;
}
