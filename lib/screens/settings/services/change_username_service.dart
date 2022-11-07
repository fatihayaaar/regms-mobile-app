import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class ChangeUsernameService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ChangeUsernameService({this.networkManager});
}
