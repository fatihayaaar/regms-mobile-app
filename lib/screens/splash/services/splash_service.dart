import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';
import 'subservices/token_check_service.dart';

class SplashService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  late final tokenCheckService;

  SplashService({this.networkManager}) {
    tokenCheckService = TokenCheckService(networkManager: networkManager);
  }
}
