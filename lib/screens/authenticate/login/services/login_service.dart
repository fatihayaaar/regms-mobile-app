import '../../../../product/network/auth/models/login_model/login_model.dart';
import '../../../../product/network/auth/models/login_model/login_response_model/login_response_model.dart';
import '../../../../product/network/base/base_service.dart';
import '../../../../product/network/network_manager.dart';

class LoginService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  LoginService({this.networkManager});

  Future<LoginResponseModel?> login({required LoginModel loginModel}) async {
    if (networkManager != null) {
      return await networkManager!.loginNetwork.login(loginModel: loginModel);
    }
    return LoginResponseModel(token: "");
  }
}
