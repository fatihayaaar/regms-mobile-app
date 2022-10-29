import 'package:json_annotation/json_annotation.dart';
import 'package:regms_flutter_client/core/models/base/base_network_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends BaseNetworkModel<LoginResponseModel> {
  final String? token;

  LoginResponseModel({this.token});

  @override
  LoginResponseModel fromJson(Map<String, Object?> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
