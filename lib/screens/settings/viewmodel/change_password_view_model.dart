import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/change_password_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class ChangePasswordViewModel extends BaseViewModel<ChangePasswordService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ChangePasswordService(
      networkManager: context!.networkManager,
    );
  }
}
