import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/models/base/base_network_model.dart';

part 'token_check_response_model.g.dart';

@JsonSerializable()
class TokenCheckResponseModel
    extends BaseNetworkModel<TokenCheckResponseModel> {
  final String? token;

  TokenCheckResponseModel({this.token});

  @override
  TokenCheckResponseModel fromJson(Map<String, Object> json) {
    return _$TokenCheckResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$TokenCheckResponseModelToJson(this);
  }
}
