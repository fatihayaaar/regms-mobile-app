import 'package:regms_flutter_client/core/services/helpers/network/network_helper.dart';
import 'package:regms_flutter_client/core/services/modules/preference_module.dart';

abstract class NetworkModule {
  NetworkHelper get providerNetworkHelper;
}

class NetworksModule {
  PreferenceModule preferenceModule;
  String baseUrl;

  NetworksModule({
    required this.preferenceModule,
    required this.baseUrl,
  });

  NetworkHelper providerNetworkHelper() => NetworkHelper(
        preferenceModule,
        baseUrl,
      );
}
