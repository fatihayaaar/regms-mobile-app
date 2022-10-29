import 'package:regms_flutter_client/constants/endpoints.dart';
import 'package:regms_flutter_client/core/services/helpers/network/enum/http_types.dart';
import 'package:regms_flutter_client/core/services/helpers/network/models/reponse_interface.dart';
import 'package:regms_flutter_client/product/network/auth/models/login_model/login_response_model/login_response_model.dart';
import 'package:regms_flutter_client/product/network/mixin/mixin_network.dart';

class LoginNetwork<T> with MixinNetwork {
  static LoginNetwork? _instance;

  static LoginNetwork instance(api) {
    if (_instance == null) {
      _instance = LoginNetwork._(api);
    }
    return _instance!;
  }

  LoginNetwork._(api);

  Future<IResponseModel<T>?> login({required loginModel}) async {
    return await api?.send(
      Endpoints.LOGIN_ENDPOINT,
      type: HttpTypes.POST,
      parseModel: LoginResponseModel(),
      data: loginModel.toJson(),
    );
  }
}
