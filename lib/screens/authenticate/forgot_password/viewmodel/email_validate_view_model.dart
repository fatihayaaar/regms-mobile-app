import 'package:flutter/material.dart';

import '../../../../product/extensions/context_extension.dart';
import '../services/email_validate_service.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/base/base_service.dart';

class EmailValidateViewModel extends BaseViewModel<EmailValidateService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = EmailValidateService(
      networkManager: context!.networkManager,
    );
  }
}
