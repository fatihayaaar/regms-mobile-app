import 'package:regms_flutter_client/core/services/helpers/network/models/error_interface.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}
