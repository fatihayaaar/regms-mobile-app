import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class SearchService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  SearchService({this.networkManager});
}
