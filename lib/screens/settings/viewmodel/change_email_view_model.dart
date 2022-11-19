import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/change_email_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class ChangeEmailViewModel extends BaseViewModel<ChangeEmailService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ChangeEmailService(
      networkManager: context!.networkManager,
    );
  }
}
