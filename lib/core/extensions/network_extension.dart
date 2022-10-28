import 'package:regms_flutter_client/core/services/helpers/request/enum/http_types.dart';

extension NetworkTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      default:
        throw 'ERROR TYPE';
    }
  }
}
