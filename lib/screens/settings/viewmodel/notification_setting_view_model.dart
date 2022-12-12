import 'package:flutter/material.dart';

import '../../../core/models/base/base_view_model.dart';
import '../../../product/extensions/context_extension.dart';
import '../../../product/network/base/base_service.dart';
import '../services/notification_setting_service.dart';

class NotificationSettingViewModel extends BaseViewModel<NotificationSettingService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = NotificationSettingService(
      networkManager: context!.networkManager,
    );
  }
}
