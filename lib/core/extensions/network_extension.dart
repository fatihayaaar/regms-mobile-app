import '../services/helpers/network/enum/http_types.dart';

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
