import 'package:flutter/material.dart';

import '../../../core/models/base/base_view_model.dart';
import '../../../product/extensions/context_extension.dart';
import '../../../product/network/base/base_service.dart';
import '../services/starter_service.dart';

class StarterViewModel extends BaseViewModel<StarterService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = StarterService(
      networkManager: context!.networkManager,
    );
  }
}
