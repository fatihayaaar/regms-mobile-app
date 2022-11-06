import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/application_constant.dart';
import '../../../theme/enum/theme_name.dart';
import '../../constants/preferences.dart';

class PersistHelper {
  final SharedPreferences sharedPreferences;

  PersistHelper(this.sharedPreferences);

  Future<bool> saveToken(String value) async {
    return await sharedPreferences.setString(Preferences.AUTH_TOKEN, value);
  }

  String? getToken() {
    return sharedPreferences.getString(Preferences.AUTH_TOKEN);
  }

  Future<bool> removeToken() async {
    return sharedPreferences.remove(Preferences.AUTH_TOKEN);
  }

  Future<bool> saveUsername(String value) async {
    return await sharedPreferences.setString(Preferences.USERNAME, value);
  }

  String? getUsername() {
    return sharedPreferences.getString(Preferences.USERNAME);
  }

  Future<bool> removeUsername() async {
    return sharedPreferences.remove(Preferences.USERNAME);
  }

  Future<bool> saveThemeMode(ThemeName value) async {
    return await sharedPreferences.setString(
      Preferences.THEME_MODE,
      value.name,
    );
  }

  Future<ThemeName> getThemeMode() async {
    String? themeMode = sharedPreferences.getString(Preferences.THEME_MODE);
    ThemeName theme = ThemeName.LIGHT;
    for (var element in ApplicationConstant.THEME_SUPPORT) {
      if (themeMode == element.name) {
        theme = element;
      }
    }
    return theme;
  }

  Future<bool> saveLanguage(String value) async {
    return await sharedPreferences.setString(Preferences.LANGUAGE_KEY, value);
  }

  Future<String?> getLanguage() async {
    return sharedPreferences.getString(Preferences.LANGUAGE_KEY);
  }
}
