import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;

  static ColorSchemeLight get instance {
    if (_instance == null) {
      _instance = ColorSchemeLight._();
    }
    return _instance!;
  }

  ColorSchemeLight._();

  static const kBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const kThemeColor = Color.fromRGBO(23, 23, 44, 1.0);
  static const kBodyTextColor = Color.fromRGBO(124, 125, 126, 1);
  static const kLoginTitleColor = Color.fromRGBO(4, 4, 54, 1.0);
  static const kLoginButtonColor = Color.fromRGBO(39, 39, 145, 1.0);
  static const kButtonContentTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const kTextFieldLightColor = Color.fromRGBO(138, 138, 138, 1.0);
  static const kTextBioColor = Color.fromRGBO(14, 14, 14, 1.0);
  static const kRegisterRichTextAboutColor = Color.fromRGBO(120, 120, 123, 1.0);
  static const kTextFieldColor = Color.fromRGBO(245, 245, 245, 1.0);
  static const kBorderColor = Color.fromRGBO(232, 232, 232, 1.0);
  static const kTextContentColor = Color.fromRGBO(33, 33, 33, 1.0);
  static const kUsernameColor = Color.fromRGBO(33, 33, 33, 1.0);
  static const kNameAndSurnameColor = Color.fromRGBO(110, 110, 110, 1.0);
  static const kCommentUsernameColor = Color.fromRGBO(33, 33, 33, 1.0);
  static const kCommentTextColor = Color.fromRGBO(72, 72, 72, 1.0);
  static const kCommentActionIconColor = Color.fromRGBO(47, 47, 47, 1.0);
  static const kPostActionTextColor = Color.fromRGBO(117, 117, 117, 1.0);
  static const kBottomSheetColor = Color.fromRGBO(20, 24, 27, 1.0);
  static const kAddPostActionIconColor = Color.fromRGBO(49, 49, 49, 1.0);
  static const kFullScreenVideoIconColor = Color.fromRGBO(255, 255, 255, 1.0);
}
