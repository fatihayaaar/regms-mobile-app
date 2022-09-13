import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/screens/membership_screens/login_screen.dart';
import 'package:regms_flutter_client/services/app_service.dart';
import 'package:regms_flutter_client/services/modules/preference_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

late AppService appService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  var sharedPref = await SharedPreferences.getInstance();
  appService = await AppServiceInject.create(
    PreferenceModule(sharedPref: sharedPref),
  );
  appService.providerPersistHelper.initMyUser();

  runApp(appService.getApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: appService.providerPersistHelper.myUser == null
          ? LoginScreen()
          : ProfileScreen(user: appService.providerPersistHelper.myUser!),
    );
  }
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color.fromRGBO(0, 0, 0, 0),
    ),
  );
}
