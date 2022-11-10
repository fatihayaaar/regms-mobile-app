import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class NotificationService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  NotificationService({this.networkManager});
}
