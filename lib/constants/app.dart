import 'package:mobx/mobx.dart';
import 'package:regms_flutter_client/models/language.dart';

const String apiURL = 'http://localhost.com';

const String defaultLanguage = 'en';

const List<String> languageSupport = ['en', 'ar', 'tr', 'de', 'az'];

List<Language> defaultLanguageSupport = languageSupport
    .map((code) => Language(
          code: code,
          locale: code,
          language: getLanguages[code]['name'],
          dictionary: {},
        ))
    .toList();

ObservableList<Language> supportedLanguages =
    ObservableList<Language>.of(defaultLanguageSupport);
