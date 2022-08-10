import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/root.dart';
import 'package:regms_flutter_client/screens/login_screen.dart';
import 'package:regms_flutter_client/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
late Root root;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  root = Root();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: root.myUser == null
          ? LoginScreen()
          : ProfileScreen(user: root.myUser!),
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
