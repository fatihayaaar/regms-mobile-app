import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class AddPostService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  AddPostService({this.networkManager});
}
