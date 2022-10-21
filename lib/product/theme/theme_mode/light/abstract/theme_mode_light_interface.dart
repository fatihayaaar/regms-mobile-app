import 'package:regms_flutter_client/product/theme/theme_mode/light/app_bar_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/bottom_navigation_bar_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/bottom_sheet_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/drawer_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/elevated_button_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/float_action_button_theme_light.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/text_theme_light.dart';

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
