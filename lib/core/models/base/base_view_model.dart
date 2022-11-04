import 'package:flutter/material.dart';

import '../../../product/base/base_service.dart';

abstract class BaseViewModel<T extends BaseService> extends ChangeNotifier {
  BuildContext? context;
  T? service;

  void setContext(BuildContext? context);

  void setService(T? service) {}
}
