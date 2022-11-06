import 'auth/login_network.dart';
import 'auth/register_network.dart';
import 'auth/token_check_network.dart';

class NetworkManager {
  static NetworkManager? _instance;
  final api;

  static NetworkManager instance(api) {
    _instance ??= NetworkManager._(api);
    return _instance!;
  }

  NetworkManager._(this.api);

  LoginNetwork get loginNetwork => LoginNetwork.instance(api);
  RegisterNetwork get registerNetwork => RegisterNetwork.instance(api);
  TokenCheckNetwork get tokenCheckNetwork => TokenCheckNetwork.instance(api);
}
