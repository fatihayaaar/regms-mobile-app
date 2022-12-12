import 'package:flutter/material.dart';

import '../../../core/models/base/base_view_model.dart';
import '../../../product/extensions/context_extension.dart';
import '../../../product/network/base/base_service.dart';
import '../services/edit_profile_service.dart';

class EditProfileViewModel extends BaseViewModel<EditProfileService> {
  @override
  BuildContext? context;
  var _length = 0;

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = EditProfileService(
      networkManager: context!.networkManager,
    );
  }

  void textFormFieldOnChanges(val) {
    length = val;
  }

  get length => _length;

  set length(length) {
    _length = length;
    notifyListeners();
  }
}
