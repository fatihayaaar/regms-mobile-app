import 'package:regms_flutter_client/core/services/helpers/network/models/error_interface.dart';
import 'package:regms_flutter_client/core/services/helpers/network/models/reponse_interface.dart';

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final IErrorModel? error;

  ResponseModel({this.data, this.error});
}
