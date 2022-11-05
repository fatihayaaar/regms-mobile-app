import 'error_model/error_response_model.dart';

abstract class IResponseModel<T> {
  T? data;
  ErrorResponseModel? error;
}
