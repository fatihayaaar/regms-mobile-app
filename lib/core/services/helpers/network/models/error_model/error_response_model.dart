import 'package:json_annotation/json_annotation.dart';

import '../../../../../models/base/base_network_model.dart';

part 'error_response_model.g.dart';

@JsonSerializable()
class ErrorResponseModel extends BaseNetworkModel<ErrorResponseModel> {
  final String? statusCode;
  final String? message;

  ErrorResponseModel({this.statusCode, this.message});

  @override
  ErrorResponseModel fromJson(Map<String, Object?> json) {
    return _$ErrorResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$ErrorResponseModelToJson(this);
  }
}
