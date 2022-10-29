import 'package:dio/dio.dart';
import 'package:regms_flutter_client/core/services/helpers/network/dio/core_dio.dart';
import 'package:regms_flutter_client/core/services/helpers/network/dio/core_dio_interface.dart';
import 'package:regms_flutter_client/core/services/modules/preference_module.dart';

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
