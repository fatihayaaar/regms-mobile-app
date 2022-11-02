import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/models/base/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  var context;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
