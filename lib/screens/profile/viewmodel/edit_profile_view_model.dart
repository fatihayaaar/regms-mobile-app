import 'package:flutter/material.dart';

import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class EditProfileViewModel extends BaseViewModel {
  @override
  BuildContext? context;
  var _length = 0;

  void textFormFieldOnChanges(val) {
    length = val;
  }

  get length => _length;

  set length(length) {
    _length = length;
    notifyListeners();
  }

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {}
}
