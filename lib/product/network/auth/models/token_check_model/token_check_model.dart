import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/models/base/base_network_model.dart';

part 'token_check_model.g.dart';

@JsonSerializable()
class TokenCheckModel extends BaseNetworkModel<TokenCheckModel> {
  final String? token;

  TokenCheckModel({this.token});

  @override
  TokenCheckModel fromJson(Map<String, Object> json) {
    return _$TokenCheckModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$TokenCheckModelToJson(this);
  }
}
