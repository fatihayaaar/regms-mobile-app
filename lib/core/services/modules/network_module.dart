import '../helpers/network/network_helper.dart';
import 'preference_module.dart';

abstract class NetworkModule {
  NetworkHelper get providerNetworkHelper;
}

class NetworksModule {
  PreferenceModule preferenceModule;
  String baseUrl;
  int receiveTimeout;
  int connectTimeout;

  NetworksModule({
    required this.preferenceModule,
    required this.baseUrl,
    required this.receiveTimeout,
    required this.connectTimeout,
  });

  NetworkHelper providerNetworkHelper() => NetworkHelper(
        preferenceModule,
        baseUrl,
        receiveTimeout,
        connectTimeout,
      );
}
