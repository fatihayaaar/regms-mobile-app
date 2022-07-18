import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constant.dart';
import 'package:regms_flutter_client/screens/StarterScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: StarterScreen(),
    ),
  );
}

ThemeData buildThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kBodyTextColor),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Color.fromRGBO(0, 0, 0, 0)),
  );
}
