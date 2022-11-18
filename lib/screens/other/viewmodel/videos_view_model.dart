import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';
import '../services/videos_service.dart';

class VideosViewModel extends BaseViewModel<VideosService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = VideosService(
      networkManager: context!.networkManager,
    );
  }
}
