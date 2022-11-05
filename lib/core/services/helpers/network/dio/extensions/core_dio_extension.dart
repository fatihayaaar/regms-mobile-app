import 'package:regms_flutter_client/core/services/helpers/network/models/error_model/error_response_model.dart';

import '../../../../../models/base/base_network_model.dart';
import '../core_dio.dart';

extension CoreDioExtension on CoreDio {
  R? responseParser<R, T>(BaseNetworkModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R?;
  }

  ErrorResponseModel? errorResponseParser<R, T>(BaseNetworkModel model, dynamic data) {
    if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as ErrorResponseModel?;
    }
    return data as ErrorResponseModel?;
  }
}
