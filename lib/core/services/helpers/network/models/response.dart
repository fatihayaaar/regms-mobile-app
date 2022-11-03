import 'error_interface.dart';
import 'reponse_interface.dart';

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final IErrorModel? error;

  ResponseModel({this.data, this.error});
}
