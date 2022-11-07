import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class PostDetailService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  PostDetailService({this.networkManager});
}
