import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

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

@JsonLiteral('data.json')
Map get getLanguages => _$getLanguagesJsonLiteral;
