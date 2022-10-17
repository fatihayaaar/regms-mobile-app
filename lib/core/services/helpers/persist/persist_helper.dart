import 'package:regms_flutter_client/core/theme/enum/theme_name.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user/user.dart';
import 'package:regms_flutter_client/core/services/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if (themeMode == ThemeName.LIGHT.name) {
      return ThemeName.LIGHT;
    } else if (themeMode == ThemeName.DARK.name) {
      return ThemeName.DARK;
    }
    return ThemeName.LIGHT;
  }

  Future<bool> saveLanguage(String value) async {
    return await sharedPreferences.setString(Preferences.languageKey, value);
  }

  Future<String?> getLanguage() async {
    return sharedPreferences.getString(Preferences.languageKey);
  }

  void initMyUser() {
    var username = appService.providerPersistHelper.getToken() ?? "";
    if (username != "") {
      myUser = User(
        username: username,
        profile: Profile(
          avatar: "assets/images/dump_1.jpg",
          nameAndSurname: "Fatih Ayar",
          bio: "Software Developer :) fayardev founder",
          followersCount: 203,
          followingCount: 1,
          coverPhoto: "assets/images/dump_2.jpg",
        ),
      );
    }
  }
}