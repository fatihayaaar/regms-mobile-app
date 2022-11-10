import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class StarterService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  StarterService({this.networkManager});
}
