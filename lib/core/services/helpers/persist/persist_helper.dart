import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/application_constant.dart';
import '../../../theme/enum/theme_name.dart';
import '../../../../models/user/user.dart';
import '../../constants/preferences.dart';

class PersistHelper {
  final SharedPreferences sharedPreferences;
  User? myUser;

  PersistHelper(this.sharedPreferences);

  Future<bool> saveToken(String value) async {
    return await sharedPreferences.setString(Preferences.authToken, value);
  }

  String? getToken() {
    return sharedPreferences.getString(Preferences.authToken);
  }

  Future<bool> removeToken() async {
    return sharedPreferences.remove(Preferences.authToken);
  }

  Future<bool> saveThemeMode(ThemeName value) async {
    return await sharedPreferences.setString(
      Preferences.themeMode,
      value.name,
    );
  }

  Future<ThemeName> getThemeMode() async {
    String? themeMode = sharedPreferences.getString(Preferences.themeMode);
    ThemeName theme = ThemeName.LIGHT;
    ApplicationConstant.THEME_SUPPORT.forEach((ThemeName element) {
      if (themeMode == element.name) {
        theme = element;
      }
    });
    return theme;
  }

  Future<bool> saveLanguage(String value) async {
    return await sharedPreferences.setString(Preferences.languageKey, value);
  }

  Future<String?> getLanguage() async {
    return sharedPreferences.getString(Preferences.languageKey);
  }
}
