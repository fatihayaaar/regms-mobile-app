import '../../../../core/services/helpers/network/models/error_model/error_response_model.dart';
import '../../../../product/base/base_service.dart';
import '../../../../product/network/auth/models/register_model/register_model.dart';
import '../../../../product/network/auth/models/register_model/register_response_model/register_response_model.dart';
import '../../../../product/network/network_manager.dart';

class RegisterService implements BaseService {
  @override
  late final NetworkManager? networkManager;

  RegisterService({this.networkManager});

  Future<RegisterResponseModel?> register(
      {required RegisterModel registerModel, required void onResponse(response), required void Function(String message) onError}) async {
    if (networkManager != null) {
      final response = await networkManager!.registerNetwork.register(registerModel: registerModel);
      onResponse(response);
      if (response is RegisterResponseModel) {
        return response;
      } else {
        ErrorResponseModel error = (response as ErrorResponseModel);
        onError(error.message!);
      }
    }
    return RegisterResponseModel(token: "");
  }
}
