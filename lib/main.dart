import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobx/mobx.dart';
import 'package:regms_flutter_client/constants/app.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/language.dart';
import 'package:regms_flutter_client/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/screens/membership_screens/login_screen.dart';
import 'package:regms_flutter_client/services/app_service.dart';
import 'package:regms_flutter_client/services/modules/preference_module.dart';
import 'package:regms_flutter_client/utils/app_localization.dart';
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

  Map<dynamic, dynamic> values = {
    0: {"code": "en"}
  };
  List<Language> languages = values.keys
      .map((key) {
        final language = values[key];
        String code = language['code'] ?? language['language_code'];
        return Language(
          code: code.toUpperCase(),
          locale: code,
          language: language['native_name'],
          dictionary: {},
        );
      })
      .toList()
      .cast<Language>();
  supportedLanguages = ObservableList<Language>.of(languages);

  runApp(appService.getApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      initialRoute: '/',
      locale: Locale(defaultLanguage),
      supportedLocales: supportedLanguages.map((language) {
        return Locale.fromSubtags(languageCode: language.locale);
      }).toList(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.firstWhere(
          (supportedLocale) {
            return supportedLocale.languageCode == locale?.languageCode;
          },
          orElse: () {
            return supportedLocales.first;
          },
        );
      },
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
