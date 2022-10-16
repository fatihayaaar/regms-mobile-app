import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/services/helpers/navigation/navigation_helper.dart';
import 'package:regms_flutter_client/services/helpers/persist/persist_helper.dart';
import 'package:regms_flutter_client/services/modules/navigation_module.dart';
import 'package:regms_flutter_client/services/modules/preference_module.dart';

abstract class AppService implements PersisModule, NavigationModule {
  static Future<AppService> create(
    PreferenceModule preferenceModule,
    NavigatorModule navigatorModule,
  ) async {
    var service = await AppServiceInject.create(
      preferenceModule,
      navigatorModule,
    );
    return service;
  }

  MyApp get getApp;
}

class AppServiceInject implements AppService {
  final PreferenceModule _preferenceModule;
  final NavigatorModule _navigatorModule;

  PersistHelper? _singletonPersistHelper;
  NavigationHelper? _singletonNavigationHelper;

  AppServiceInject(this._preferenceModule, this._navigatorModule);

  static Future<AppService> create(
    PreferenceModule preferenceModule,
    NavigatorModule navigatorModule,
  ) async {
    final injector = AppServiceInject(
      preferenceModule,
      navigatorModule,
    );

    return injector;
  }

  MyApp _createApp() => MyApp();

  PersistHelper _createPersistHelper() =>
      _singletonPersistHelper ??= _preferenceModule.providerPersistHelper();

  @override
  PersistHelper get providerPersistHelper => _createPersistHelper();

  NavigationHelper _createNavigatorHelper() => _singletonNavigationHelper ??=
      _navigatorModule.providerNavigationHelper();

  @override
  NavigationHelper get providerNavigationHelper => _createNavigatorHelper();

  @override
  MyApp get getApp => _createApp();
}
