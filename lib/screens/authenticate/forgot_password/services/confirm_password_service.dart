import '../../../../product/network/base/base_service.dart';
import '../../../../product/network/network_manager.dart';

class ConfirmPasswordService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ConfirmPasswordService({this.networkManager});
}
