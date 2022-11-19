import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/change_username_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class ChangeUsernameViewModel extends BaseViewModel<ChangeUsernameService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ChangeUsernameService(
      networkManager: context!.networkManager,
    );
  }
}
