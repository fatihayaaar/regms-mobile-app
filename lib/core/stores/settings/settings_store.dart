import 'package:mobx/mobx.dart';
import 'package:regms_flutter_client/constants/application_constant.dart';
import 'package:regms_flutter_client/core/theme/enum/theme_name.dart';
import 'package:regms_flutter_client/models/language.dart';
import 'package:regms_flutter_client/core/services/helpers/persist/persist_helper.dart';

class SettingStore {
  final PersistHelper _persistHelper;

  var _locale = ApplicationConstant.DEFAULT_LANGUAGE;
  var _themeMode = ApplicationConstant.DEFAULT_THEME;
  var _supportedLanguages = ObservableList<Language>.of(defaultLanguageSupport);

  SettingStore(this._persistHelper) {
    init();
  }

  ThemeName get themeMode => _themeMode;

  String get locale => _locale;

  ObservableList<Language> get supportedLanguages => _supportedLanguages;

  void init() async {
    await restore();
    List<Language> languages = getLanguages.keys
        .map((key) {
          return Language(
            code: getLanguages[key]["code"].toUpperCase(),
            locale: getLanguages[key]["code"],
            language: getLanguages[key]['nativeName'],
          );
        })
        .toList()
        .cast<Language>();
    _supportedLanguages = ObservableList<Language>.of(languages);
  }

  Future<void> restore() async {
    _themeMode = await _persistHelper.getThemeMode();

    String? lang = await _persistHelper.getLanguage();
    if (lang != "" && lang.runtimeType == String) {
      _locale = lang!;
    }
  }

  Future<void> changeLanguage(String value) async {
    _locale = value;
    await _persistHelper.saveLanguage(value);
  }

  Future<void> setThemeMode({required ThemeName value}) async {
    await _persistHelper.saveThemeMode(value);
    _themeMode = value;
  }
}

List<Language> defaultLanguageSupport = ApplicationConstant.LANGUAGE_SUPPORT
    .map((code) => Language(
          code: code,
          locale: code,
          language: getLanguages[code]['name'],
        ))
    .toList();
