import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../../../product/network/base/base_service.dart';
import '../services/notification_service.dart';
import '../../../core/models/base/base_view_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = NotificationService(
      networkManager: context!.networkManager,
    );
  }
}
