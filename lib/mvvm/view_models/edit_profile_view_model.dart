import 'package:flutter/material.dart';

class EditProfileViewModel with ChangeNotifier {
  var _length = 0;

  void textFormFieldOnChanges(val) {
    length = val;
  }

  get length => _length;

  set length(length) {
    _length = length;
    notifyListeners();
  }
}