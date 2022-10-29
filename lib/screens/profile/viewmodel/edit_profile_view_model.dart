import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/models/base/base_view_model.dart';

class EditProfileViewModel extends BaseViewModel {
  var context;
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
  void setContext(BuildContext context) {
    this.context = context;
  }
}
