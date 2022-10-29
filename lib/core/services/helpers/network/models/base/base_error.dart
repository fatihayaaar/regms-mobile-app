import 'package:regms_flutter_client/core/services/helpers/network/models/error_interface.dart';

class BaseError extends IErrorModel {
  final String message;

  BaseError(this.message);
}
