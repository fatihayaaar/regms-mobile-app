import 'package:regms_flutter_client/core/models/base/base_model.dart';
import 'package:regms_flutter_client/core/services/helpers/network/enum/http_types.dart';
import 'package:regms_flutter_client/core/services/helpers/network/models/reponse_interface.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
