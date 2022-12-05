import 'package:flutter/material.dart';

import '../../../../product/extensions/context_extension.dart';
import '../services/reset_password_service.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/base/base_service.dart';

class ResetPasswordViewModel extends BaseViewModel<ResetPasswordService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ResetPasswordService(
      networkManager: context!.networkManager,
    );
  }
}
