import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class VideosService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  VideosService({this.networkManager});
}
