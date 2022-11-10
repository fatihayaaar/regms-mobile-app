import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class UsersService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  UsersService({this.networkManager});
}
