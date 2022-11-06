import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  static RegExp exp = RegExp(r"\{(.*?)\}");
  late Map<String, String> localizedStrings;

  static const delegate = _AppLocalizationsDelegate();

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<String> _loadAssets(String languageCode) async {
    try {
      return await rootBundle.loadString('assets/lang/$languageCode.json');
    } catch (_) {
      return await rootBundle.loadString('assets/lang/en.json');
    }
  }

  Future<bool> load() async {
    String jsonString = await _loadAssets(locale.languageCode);
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedStrings = jsonMap.map((key, value) {
      return MapEntry(
        key,
        value.toString().replaceAll(r"\'", "'").replaceAll(r"\t", " "),
      );
    });

    return true;
  }

  static String replace(txt, [Map<String, String>? options]) => txt.replaceAllMapped(
        exp,
        (Match m) {
          if (m.group(0) == null || m.group(1) == null) {
            return '';
          }
          return options?[m.group(1)] ?? m.group(0) ?? '';
        },
      );

  String translate(String key, [Map<String, String>? options]) {
    String txt = localizedStrings[key] ?? key;

    if (options == null || options.isEmpty) {
      return txt;
    }
    return replace(txt, options);
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final String tag = "AppLocalizations";

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kMaterialSupportedLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
