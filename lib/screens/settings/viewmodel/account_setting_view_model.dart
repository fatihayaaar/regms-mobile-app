import 'package:flutter/material.dart';

import '../../../core/models/base/base_view_model.dart';
import '../../../product/extensions/context_extension.dart';
import '../../../product/network/base/base_service.dart';
import '../services/account_setting_service.dart';

class AccountSettingViewModel extends BaseViewModel<AccountSettingService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = AccountSettingService(
      networkManager: context!.networkManager,
    );
  }
}
