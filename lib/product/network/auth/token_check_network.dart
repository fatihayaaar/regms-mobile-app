import '../../../core/services/helpers/network/models/error_model/error_response_model.dart';
import 'models/token_check_model/token_check_response_model/token_check_response_model.dart';
import '../../../core/services/helpers/network/enum/http_types.dart';
import '../mixin/mixin_network.dart';

class TokenCheckNetwork<T> with MixinNetwork {
  static TokenCheckNetwork? _instance;

  static TokenCheckNetwork instance(api) {
    _instance ??= TokenCheckNetwork._(api);
    return _instance!;
  }

  TokenCheckNetwork._(api);

  Future<TokenCheckResponseModel?> check({required tokenCheckModel}) async {
    final response = await api?.send<TokenCheckResponseModel, TokenCheckResponseModel, ErrorResponseModel>(
      "path",
      type: HttpTypes.POST,
      parseModel: TokenCheckResponseModel(),
      errorParseModel: ErrorResponseModel(),
      data: tokenCheckModel,
    );

    if (response?.data is TokenCheckResponseModel) {
      return response?.data;
    } else {
      return null;
    }
  }
}
