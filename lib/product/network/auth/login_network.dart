import '../../../constants/endpoints.dart';
import '../../../core/services/helpers/network/enum/http_types.dart';
import '../../../core/services/helpers/network/models/error_model/error_response_model.dart';
import 'models/login_model/login_response_model/login_response_model.dart';
import '../mixin/mixin_network.dart';

class LoginNetwork<T> with MixinNetwork {
  static LoginNetwork? _instance;

  static LoginNetwork instance(api) {
    if (_instance == null) {
      _instance = LoginNetwork._(api);
    }
    return _instance!;
  }

  LoginNetwork._(api);

  Future<LoginResponseModel?> login({required loginModel}) async {
    final response = await api?.send<LoginResponseModel, LoginResponseModel, ErrorResponseModel>(
      Endpoints.LOGIN_ENDPOINT,
      type: HttpTypes.POST,
      parseModel: LoginResponseModel(),
      errorParseModel: ErrorResponseModel(),
      data: loginModel,
    );

    if (response?.data is LoginResponseModel) {
      return response?.data;
    } else {
      return null;
    }
  }
}
