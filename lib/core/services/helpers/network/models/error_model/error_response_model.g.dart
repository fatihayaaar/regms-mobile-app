// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      statusCode: json['statusCode'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
