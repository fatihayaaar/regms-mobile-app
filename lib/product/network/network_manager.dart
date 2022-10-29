import 'package:regms_flutter_client/product/network/auth/login_network.dart';
import 'package:regms_flutter_client/product/network/auth/register_network.dart';

class NetworkManager {
  static NetworkManager? _instance;
  final api;

  static NetworkManager instance(api) {
    if (_instance == null) {
      _instance = NetworkManager._(api);
    }
    return _instance!;
  }

  NetworkManager._(this.api);

  LoginNetwork get loginNetwork => LoginNetwork.instance(api);
  RegisterNetwork get registerNetwork => RegisterNetwork.instance(api);
}
