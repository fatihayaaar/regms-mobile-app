class Language {
  String code;
  String locale;
  String language;
  Map<String, String> dictionary;

  Language({
    required this.code,
    required this.locale,
    required this.language,
    required this.dictionary,
  });
}

Map get getLanguages => {
  'en': {'name': 'English', 'nativeName': 'English'},
};