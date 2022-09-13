import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/services/helpers/persist/persist_helper.dart';
import 'package:regms_flutter_client/services/modules/preference_module.dart';

abstract class AppService implements PersisModule {
  static Future<AppService> create(
    PreferenceModule preferenceModule,
  ) async {
    var service = await AppServiceInject.create(
      preferenceModule,
    );
    return service;
  }

  MyApp get getApp;
}

class AppServiceInject implements AppService {
  final PreferenceModule _preferenceModule;

  PersistHelper? _singletonPersistHelper;

  AppServiceInject(this._preferenceModule);

  static Future<AppService> create(
    PreferenceModule preferenceModule,
  ) async {
    final injector = AppServiceInject(
      preferenceModule,
    );

    return injector;
  }

  MyApp _createApp() => MyApp();

  PersistHelper _createPersistHelper() =>
      _singletonPersistHelper ??= _preferenceModule.providerPersistHelper();

  @override
  PersistHelper get providerPersistHelper => _createPersistHelper();

  @override
  MyApp get getApp => _createApp();
}
