import 'package:flutter/material.dart';

import '../../../../product/extensions/context_extension.dart';
import '../services/forgot_password_service.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/base/base_service.dart';

class ForgotPasswordViewModel extends BaseViewModel<ForgotPasswordService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ForgotPasswordService(
      networkManager: context!.networkManager,
    );
  }
}
