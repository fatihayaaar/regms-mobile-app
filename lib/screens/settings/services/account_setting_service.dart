import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class AccountSettingService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  AccountSettingService({this.networkManager});
}
