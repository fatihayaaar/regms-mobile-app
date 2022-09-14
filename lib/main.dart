import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/services/app_service.dart';
import 'package:regms_flutter_client/services/modules/preference_module.dart';
import 'package:regms_flutter_client/stores/settings/settings_store.dart';
import 'package:regms_flutter_client/utils/app_localization.dart';
import 'package:regms_flutter_client/views/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/login_screen.dart';
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
  final SettingStore _settingStore = SettingStore(
    appService.providerPersistHelper,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingStore>(create: (_) => _settingStore),
      ],
      child: Consumer<SettingStore>(
        builder: (context, store, child) => Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: buildThemeData(),
            initialRoute: '/',
            locale: Locale(store.locale),
            supportedLocales: store.supportedLanguages.map((language) {
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
          ),
        ),
      ),
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
