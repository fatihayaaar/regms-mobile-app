import 'package:flutter/material.dart';

import '../../../../product/extensions/context_extension.dart';
import '../services/confirm_password_service.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/base/base_service.dart';

class ConfirmPasswordViewModel extends BaseViewModel<ConfirmPasswordService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ConfirmPasswordService(
      networkManager: context!.networkManager,
    );
  }
}
