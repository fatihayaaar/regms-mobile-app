import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class ProfileService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ProfileService({this.networkManager});
}
