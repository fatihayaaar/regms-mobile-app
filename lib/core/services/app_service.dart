import 'helpers/network/network_helper.dart';
import 'modules/network_module.dart';
import '../../main.dart';
import 'helpers/navigation/navigation_helper.dart';
import 'helpers/persist/persist_helper.dart';
import 'modules/navigation_module.dart';
import 'modules/preference_module.dart';

abstract class AppService
    implements PersisModule, NavigationModule, NetworkModule {
  static Future<AppService> create(
    PreferenceModule preferenceModule,
    NavigatorModule navigatorModule,
    NetworksModule networksModule,
  ) async {
    var service = await AppServiceInject.create(
      preferenceModule,
      navigatorModule,
      networksModule,
    );
    return service;
  }

  MyApp get getApp;
}

class AppServiceInject implements AppService {
  final PreferenceModule _preferenceModule;
  final NavigatorModule _navigatorModule;
  final NetworksModule _networksModule;

  PersistHelper? _singletonPersistHelper;
  NavigationHelper? _singletonNavigationHelper;
  NetworkHelper? _singletonNetworkHelper;

  AppServiceInject(
    this._preferenceModule,
    this._navigatorModule,
    this._networksModule,
  );

  static Future<AppService> create(
    PreferenceModule preferenceModule,
    NavigatorModule navigatorModule,
    NetworksModule networksModule,
  ) async {
    final injector = AppServiceInject(
      preferenceModule,
      navigatorModule,
      networksModule,
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

  NetworkHelper _createNetworkHelper() =>
      _singletonNetworkHelper ??= _networksModule.providerNetworkHelper();

  @override
  NetworkHelper get providerNetworkHelper => _createNetworkHelper();

  @override
  MyApp get getApp => _createApp();
}
