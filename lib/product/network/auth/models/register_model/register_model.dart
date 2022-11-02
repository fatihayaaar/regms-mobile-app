import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/models/base/base_network_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseNetworkModel<RegisterModel> {
  final String? email;
  final String? password;

  RegisterModel({this.email, this.password});

  @override
  RegisterModel fromJson(Map<String, Object?> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RegisterModelToJson(this);
  }
}
