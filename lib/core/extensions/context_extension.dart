import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/utils/app_localization.dart';

extension ContextExtension on BuildContext {}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
}

extension LocalizationsExtension on BuildContext {
  Function(String) get translate => AppLocalizations.of(this)!.translate;
}
