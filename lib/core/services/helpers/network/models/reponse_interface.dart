import 'error_interface.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}
