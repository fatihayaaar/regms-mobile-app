import '../../../../product/base/base_service.dart';
import '../../../../product/network/auth/models/register_model/register_model.dart';
import '../../../../product/network/auth/models/register_model/register_response_model/register_response_model.dart';
import '../../../../product/network/network_manager.dart';

class RegisterService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  RegisterService({this.networkManager});

  Future<RegisterResponseModel?> register({required RegisterModel registerModel}) async {
    if (networkManager != null) {
      return await networkManager!.registerNetwork.register(registerModel: registerModel);
    }
    return RegisterResponseModel(token: "");
  }
}
