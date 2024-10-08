import '../../../../models/base/base_network_model.dart';
import '../enum/http_types.dart';
import '../models/response_interface.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseNetworkModel, E extends BaseNetworkModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    required E errorParseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseNetworkModel, E extends BaseNetworkModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    required E errorParseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseNetworkModel, E extends BaseNetworkModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    required E errorParseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseNetworkModel, E extends BaseNetworkModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    required E errorParseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
