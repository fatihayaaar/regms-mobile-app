import 'package:dio/dio.dart';

import 'dio/core_dio.dart';
import 'dio/core_dio_interface.dart';
import '../../modules/preference_module.dart';

class NetworkHelper {
  final PreferenceModule _preferenceModule;

  ICoreDioNullSafety? api;

  NetworkHelper(
    this._preferenceModule,
    baseUrl,
    receiveTimeout,
    connectTimeout,
  ) {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: receiveTimeout,
      //sendTimeout: sendTimeout,
      connectTimeout: connectTimeout,
      headers: {
        'val': _preferenceModule.providerPersistHelper().getToken(),
      },
    );

    api = CoreDio(baseOptions);
  }
}
