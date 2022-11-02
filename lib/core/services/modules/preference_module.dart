import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/persist/persist_helper.dart';

abstract class PersisModule {
  PersistHelper get providerPersistHelper;
}

class PreferenceModule {
  SharedPreferences sharedPref;

  PreferenceModule({required this.sharedPref});

  PersistHelper providerPersistHelper() => PersistHelper(sharedPref);
}
