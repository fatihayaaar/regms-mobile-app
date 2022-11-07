import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class ChangeEmailService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ChangeEmailService({this.networkManager});
}
