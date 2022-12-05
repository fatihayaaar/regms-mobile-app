import '../../../../product/network/base/base_service.dart';
import '../../../../product/network/network_manager.dart';

class ResetPasswordService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ResetPasswordService({this.networkManager});
}
