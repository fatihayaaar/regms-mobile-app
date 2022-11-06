import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/application_constant.dart';
import 'constants/endpoints.dart';
import 'core/services/app_service.dart';
import 'core/services/modules/navigation_module.dart';
import 'core/services/modules/network_module.dart';
import 'core/services/modules/preference_module.dart';
import 'core/stores/settings/settings_store.dart';
import 'core/theme/app_theme_container.dart';
import 'core/theme/enum/theme_name.dart';
import 'core/utils/app_localization.dart';
import 'product/navigation/navigation_route.dart';
import 'product/network/network_manager.dart';
import 'product/theme/app_theme_data.dart';

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
  cameras = await availableCameras();

  runApp(appService.getApp);
}

class MyApp extends StatelessWidget {
  final SettingStore _settingStore = SettingStore(
    appService.providerPersistHelper,
  );

  final NetworkManager _networkManager = NetworkManager.instance(
    appService.providerNetworkHelper.api,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingStore>(create: (_) => _settingStore),
        Provider<NetworkManager>(create: (_) => _networkManager),
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
          ),
        ),
      ),
    );
  }
}
