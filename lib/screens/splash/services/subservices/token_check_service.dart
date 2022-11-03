import '../../../../product/network/auth/models/token_check_model/token_check_model.dart';
import '../../../../product/network/auth/models/token_check_model/token_check_response_model/token_check_response_model.dart';
import '../../../../product/network/network_manager.dart';
import '../../../../product/base/base_service.dart';

class TokenCheckService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  TokenCheckService({this.networkManager});

  Future<bool> check(String token) async {
    TokenCheckModel tokenCheckModel = TokenCheckModel(token: token);
    if (networkManager != null) {
      TokenCheckResponseModel response = await networkManager!.tokenCheckNetwork.check(
        tokenCheckModel: tokenCheckModel,
      ) as TokenCheckResponseModel;
      if (response.isToken != null) {
        return response.isToken!;
      }
    }
    return false;
  }
}
