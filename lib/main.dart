import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/core/services/app_service.dart';
import 'package:regms_flutter_client/core/services/helpers/navigation/navigation_route.dart';
import 'package:regms_flutter_client/core/services/modules/navigation_module.dart';
import 'package:regms_flutter_client/core/services/modules/preference_module.dart';
import 'package:regms_flutter_client/core/stores/settings/settings_store.dart';
import 'package:regms_flutter_client/core/utils/app_localization.dart';
import 'package:regms_flutter_client/core/theme/app_theme_container.dart';
import 'package:regms_flutter_client/view/screens/profile_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late AppService appService;
late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ),
  );

  var sharedPref = await SharedPreferences.getInstance();
  appService = await AppServiceInject.create(
    PreferenceModule(sharedPref: sharedPref),
    NavigatorModule(),
  );
  appService.providerPersistHelper.initMyUser();
  cameras = await availableCameras();

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
            theme:
                AppThemeContainer.instance.getAppTheme(store.themeMode).theme,
            initialRoute: '/',
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            navigatorKey: appService.providerNavigationHelper.navigatorKey,
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
