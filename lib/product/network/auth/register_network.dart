import 'package:regms_flutter_client/core/services/helpers/network/enum/http_types.dart';
import 'package:regms_flutter_client/core/services/helpers/network/models/reponse_interface.dart';
import 'package:regms_flutter_client/product/network/auth/models/register_model/register_response_model/register_response_model.dart';
import 'package:regms_flutter_client/product/network/mixin/mixin_network.dart';

class RegisterNetwork<T> with MixinNetwork {
  static RegisterNetwork? _instance;

  static RegisterNetwork instance(api) {
    if (_instance == null) {
      _instance = RegisterNetwork._(api);
    }
    return _instance!;
  }

  RegisterNetwork._(api);

  Future<IResponseModel<T>?> register({required registerModel}) async {
    return await api?.send(
      "path",
      type: HttpTypes.POST,
      parseModel: RegisterResponseModel(),
      data: registerModel.toJson(),
    );
  }
}
