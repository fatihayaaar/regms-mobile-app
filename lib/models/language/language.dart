class Language {
  String code;
  String locale;
  String language;

  Language({
    required this.code,
    required this.locale,
    required this.language,
  });
}

Map get getLanguages => {
  'en': {'name': 'English', 'nativeName': 'English', "code" : "en"},
  'tr': {'name': 'Turkish', 'nativeName': 'Turkish', "code": "tr"},
};