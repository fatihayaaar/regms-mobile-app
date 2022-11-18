import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/profile_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../models/post/post.dart';
import '../../../product/network/base/base_service.dart';

class ProfileViewModel extends BaseViewModel<ProfileService> {
  var _isMyProfile;
  var _user;
  var _selectList = ["All", "Videos", "Photos"];
  List<Post> _posts = [];

  ProfileViewModel(this._posts, this._user, this._isMyProfile);

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = ProfileService(
      networkManager: context!.networkManager,
    );
  }

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
