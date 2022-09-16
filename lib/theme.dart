import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/stores/settings/settings_store.dart';

class MyTheme {
  ThemeData buildTheme(SettingStore store) {
    final base = store.darkMode ? ThemeData.dark() : ThemeData.light();
    return base.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: _getColor(
          value: base,
          lightColor: SystemUiOverlayStyle.dark,
          darkColor: SystemUiOverlayStyle.light,
        ),
        backgroundColor: kAppbarColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: kBodyTextColor),
      ),
      backgroundColor: kBackgroundColor,
    );
  }

  _getColor({value, lightColor, darkColor}) {
    if (value == ThemeData.light()) {
      return lightColor;
    }
    return darkColor;
  }
}
