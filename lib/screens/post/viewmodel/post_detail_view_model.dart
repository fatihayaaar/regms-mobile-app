import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/post_detail_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class PostDetailViewModel extends BaseViewModel<PostDetailService> {
  var _post;

  PostDetailViewModel({required post}) {
    _post = post;
  }

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = PostDetailService(
      networkManager: context!.networkManager,
    );
  }

  get post => _post;

  set post(post) {
    _post = post;
    notifyListeners();
  }
}
