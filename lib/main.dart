import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/application_constant.dart';
import 'package:regms_flutter_client/constants/endpoints.dart';
import 'package:regms_flutter_client/core/services/app_service.dart';
import 'package:regms_flutter_client/core/services/modules/network_module.dart';
import 'package:regms_flutter_client/product/navigation/navigation_route.dart';
import 'package:regms_flutter_client/core/services/modules/navigation_module.dart';
import 'package:regms_flutter_client/core/services/modules/preference_module.dart';
import 'package:regms_flutter_client/core/stores/settings/settings_store.dart';
import 'package:regms_flutter_client/core/theme/enum/theme_name.dart';
import 'package:regms_flutter_client/core/utils/app_localization.dart';
import 'package:regms_flutter_client/core/theme/app_theme_container.dart';
import 'package:regms_flutter_client/product/theme/app_theme_data.dart';
import 'package:regms_flutter_client/screens/profile/view/profile_screen.dart';
import 'package:regms_flutter_client/screens/authenticate/login/view/login_screen.dart';
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

  var preferenceModule = PreferenceModule(sharedPref: sharedPref);
  var navigatorModule = NavigatorModule();

  var networksModule = NetworksModule(
    preferenceModule: preferenceModule,
    baseUrl: ApplicationConstant.API_URL,
    receiveTimeout: Endpoints.RECEIVE_TIMEOUT,
    connectTimeout: Endpoints.CONNECT_TIMEOUT,
  );

  appService = await AppServiceInject.create(
    preferenceModule,
    navigatorModule,
    networksModule,
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
            theme: AppThemeContainer.instance.getAppTheme(
              theme: store.themeMode,
              themeData: {
                ThemeName.LIGHT: AppThemeData.instance.themeModeLight.themeData,
                ThemeName.DARK: AppThemeData.instance.themeModeDark.themeData,
              },
            ).theme,
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
