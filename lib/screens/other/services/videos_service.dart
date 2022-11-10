import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class VideoService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  VideoService({this.networkManager});
}
