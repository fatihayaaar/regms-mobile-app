import '../../../../product/network/base/base_service.dart';
import '../../../../product/network/network_manager.dart';

class EmailValidateService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  EmailValidateService({this.networkManager});
}
