import '../../../core/services/helpers/network/enum/http_types.dart';
import 'models/register_model/register_response_model/register_response_model.dart';
import '../mixin/mixin_network.dart';

class RegisterNetwork<T> with MixinNetwork {
  static RegisterNetwork? _instance;

  static RegisterNetwork instance(api) {
    if (_instance == null) {
      _instance = RegisterNetwork._(api);
    }
    return _instance!;
  }

  RegisterNetwork._(api);

  Future<RegisterResponseModel?> register({required registerModel}) async {
    final response = await api?.send<RegisterResponseModel, RegisterResponseModel>(
      "path",
      type: HttpTypes.POST,
      parseModel: RegisterResponseModel(),
      data: registerModel,
    );

    if (response?.data is RegisterResponseModel) {
      return response?.data;
    } else {
      return null;
    }
  }
}
