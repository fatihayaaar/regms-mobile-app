import 'package:json_annotation/json_annotation.dart';
import 'package:regms_flutter_client/core/models/base/base_network_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseNetworkModel<LoginModel> {
  final String? username;
  final String? password;

  LoginModel({this.username, this.password});

  @override
  LoginModel fromJson(Map<String, Object?> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginModelToJson(this);
  }
}
