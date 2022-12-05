import '../../../../product/network/base/base_service.dart';
import '../../../../product/network/network_manager.dart';

class ForgotPasswordService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  ForgotPasswordService({this.networkManager});
}
