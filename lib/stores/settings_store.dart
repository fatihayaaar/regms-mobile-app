import 'package:mobx/mobx.dart';
import 'package:regms_flutter_client/constants/app.dart';
import 'package:regms_flutter_client/models/language.dart';
import 'package:regms_flutter_client/services/helpers/persist/persist_helper.dart';

class SettingStore {
  final PersistHelper _persistHelper;

  String _locale = defaultLanguage;
  bool _darkMode = false;

  SettingStore(this._persistHelper) {
    init();
  }

  bool get darkMode => _darkMode;

  String get locale => _locale;

  ObservableList<Language> get supportedLanguages => _supportedLanguages;

  ObservableList<Language> _supportedLanguages =
      ObservableList<Language>.of(defaultLanguageSupport);

  void init() async {
    await restore();
    Map<dynamic, dynamic> values = {
      0: {"code": "en"},
      1: {"code": "tr"},
    };
    List<Language> languages = values.keys
        .map((key) {
          final language = values[key];
          String code = language['code'] ?? language['language_code'];
          return Language(
            code: code.toUpperCase(),
            locale: code,
            language: language['native_name'],
            dictionary: {},
          );
        })
        .toList()
        .cast<Language>();
    _supportedLanguages = ObservableList<Language>.of(languages);
  }

  Future<void> restore() async {
    _darkMode = await _persistHelper.getDarkMode();

    String? lang = await _persistHelper.getLanguage();
    if (lang != "" && lang.runtimeType == String) {
      _locale = lang!;
    }
  }

  Future<void> changeLanguage(String value) async {
    _locale = value;
    await _persistHelper.saveLanguage(value);
  }

  Future<void> setDarkMode({required bool value}) async {
    await _persistHelper.saveDarkMode(value);
    _darkMode = value;
  }
}

List<Language> defaultLanguageSupport = languageSupport
    .map((code) => Language(
          code: code,
          locale: code,
          language: getLanguages[code]['name'],
          dictionary: {},
        ))
    .toList();
