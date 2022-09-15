import 'package:flutter/material.dart';
import 'package:regms_flutter_client/stores/settings/settings_store.dart';

class Theme {

  ThemeData buildTheme(SettingStore store) {
    final base = store.darkMode ? ThemeData.dark() : ThemeData.light();

    return base.copyWith();
  }
}