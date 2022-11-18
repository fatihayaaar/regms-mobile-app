import '../../../product/network/base/base_service.dart';
import '../../../product/network/network_manager.dart';

class EditProfileService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  EditProfileService({this.networkManager});
}
