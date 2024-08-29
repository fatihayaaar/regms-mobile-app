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
      receiveTimeout: Duration(milliseconds: receiveTimeout),
      connectTimeout: Duration(milliseconds: connectTimeout),
      //sendTimeout: sendTimeout,
      headers: {
        'val': _preferenceModule.providerPersistHelper().getToken(),
      },
    );

    api = CoreDio(baseOptions);
  }
}
