import 'error_model/error_response_model.dart';
import 'response_interface.dart';

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final ErrorResponseModel? error;

  ResponseModel({this.data, this.error});
}
