import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/models/base/base_network_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends BaseNetworkModel<RegisterResponseModel> {
  final String? token;

  RegisterResponseModel({this.token});

  @override
  RegisterResponseModel fromJson(Map<String, Object?> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RegisterResponseModelToJson(this);
  }
}
