import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/post/post.dart';

class ProfileViewModel with ChangeNotifier {
  var _isMyProfile;
  var _user;
  var _selectList = ["All", "Videos", "Photos"];
  List<Post> _posts = [];

  ProfileViewModel(this._posts, this._user, this._isMyProfile);

  get isMyProfile => _isMyProfile;

  set isMyProfile(isMyProfile) {
    _isMyProfile = isMyProfile;
    notifyListeners();
  }

  get user => _user;

  set user(user) {
    _user = user;
    notifyListeners();
  }

  get selectList => _selectList;

  set selectList(selectList) {
    _selectList = selectList;
    notifyListeners();
  }

  List<Post> get posts => _posts;

  set posts(posts) {
    _posts = posts;
    notifyListeners();
  }
}
