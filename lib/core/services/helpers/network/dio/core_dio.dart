import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../../extensions/network_extension.dart';
import '../models/base/base_error.dart';
import '../../../../models/base/base_network_model.dart';
import 'core_dio_interface.dart';
import '../enum/http_types.dart';
import '../models/reponse_interface.dart';
import '../models/response.dart';
import 'extensions/core_dio_extension.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseNetworkModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request(
      path,
      data: data,
      options: Options(method: type.rawValue),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
}
