import 'package:flutter/material.dart';

class PostDetailViewModel with ChangeNotifier {
  var _post;

  PostDetailViewModel({required post}) {
    this._post = post;
  }

  get post => _post;

  set post(post) {
    _post = post;
    notifyListeners();
  }
}
