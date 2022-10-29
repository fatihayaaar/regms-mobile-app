import 'package:dio/dio.dart';
import 'package:regms_flutter_client/core/services/helpers/network/dio/core_dio.dart';
import 'package:regms_flutter_client/core/services/helpers/network/dio/core_dio_interface.dart';
import 'package:regms_flutter_client/core/services/modules/preference_module.dart';

class NetworkHelper {
  final PreferenceModule _preferenceModule;

  ICoreDioNullSafety? coreDio;

  NetworkHelper(this._preferenceModule, baseUrl) {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'val': _preferenceModule.providerPersistHelper().getToken(),
      },
    );

    coreDio = CoreDio(baseOptions);
  }
}
