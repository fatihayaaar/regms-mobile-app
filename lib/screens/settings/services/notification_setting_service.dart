import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class NotificationSettingService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  NotificationSettingService({this.networkManager});
}
