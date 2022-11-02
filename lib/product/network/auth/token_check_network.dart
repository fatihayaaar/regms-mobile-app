import 'package:regms_flutter_client/product/network/auth/models/token_check_model/token_check_model.dart';
import 'package:regms_flutter_client/product/network/auth/models/token_check_model/token_check_response_model/token_check_response_model.dart';

import '../../../core/services/helpers/network/enum/http_types.dart';
import '../../../core/services/helpers/network/models/reponse_interface.dart';
import '../mixin/mixin_network.dart';

class TokenCheckNetwork<T> with MixinNetwork {
  static TokenCheckNetwork? _instance;

  static TokenCheckNetwork instance(api) {
    if (_instance == null) {
      _instance = TokenCheckNetwork._(api);
    }
    return _instance!;
  }

  TokenCheckNetwork._(api);

  Future<IResponseModel<T>?> check({required tokenCheckModel}) async {
    return await api?.send(
      "path",
      type: HttpTypes.POST,
      parseModel: TokenCheckResponseModel(),
      data: tokenCheckModel.toJson(),
    );
  }
}
