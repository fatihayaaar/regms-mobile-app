import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:regms_flutter_client/core/extensions/network_extension.dart';
import 'package:regms_flutter_client/core/models/base/base_error.dart';
import 'package:regms_flutter_client/core/models/base/base_model.dart';
import 'package:regms_flutter_client/core/services/helpers/request/enum/http_types.dart';
import 'package:regms_flutter_client/core/services/helpers/request/models/reponse_interface.dart';
import 'package:regms_flutter_client/core/services/helpers/request/models/response.dart';

class CoreDio with DioMixin implements Dio {
  //, ICoreDioNullSafety {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(
      path,
      data: data,
      options: Options(method: type.rawValue),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
      // final model = _responseParser<R, T>(parseModel, response.data);
      // return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
}
