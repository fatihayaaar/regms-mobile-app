import 'package:regms_flutter_client/services/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistHelper {
  final SharedPreferences sharedPreferences;

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
}
