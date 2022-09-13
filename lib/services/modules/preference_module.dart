import 'package:regms_flutter_client/services/helpers/persist/persist_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersisModule {
  PersistHelper get providerPersistHelper;
}

class PreferenceModule {
  SharedPreferences sharedPref;

  PreferenceModule({required this.sharedPref});

  PersistHelper providerPersistHelper() => PersistHelper(sharedPref);
}
