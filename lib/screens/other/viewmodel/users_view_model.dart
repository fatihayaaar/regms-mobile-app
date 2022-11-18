import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/users_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../models/user/user_list_item.dart';
import '../../../product/network/base/base_service.dart';

class UsersViewModel extends BaseViewModel<UsersService> {
  List<UserListItem> _users = [
    UserListItem(
      username: 'fayar',
      avatar: "assets/images/dump_1.jpg",
      nameAndSurname: "Fatih Ayar",
      isFollow: false,
      isStory: true,
    ),
    UserListItem(
      username: 'berkcanoz',
      avatar: "assets/images/dump_2.jpg",
      nameAndSurname: "Berkercan",
      isFollow: false,
    ),
    UserListItem(
      username: 'damali',
      avatar: "assets/images/dump_2.jpg",
      isFollow: false,
    ),
    UserListItem(
      username: 'polat',
      avatar: "assets/images/dump_1.jpg",
      isFollow: false,
    ),
  ];

  UserListItem _userRequest = UserListItem(
    username: 'Follower Request',
    avatar: "assets/images/dump_1.jpg",
    nameAndSurname: "Approve or delete requests",
    isFollow: false,
  );

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = UsersService(
      networkManager: context!.networkManager,
    );
  }

  List<UserListItem> get users => _users;

  set users(value) {
    _users = value;
    notifyListeners();
  }

  UserListItem get userRequest => _userRequest;

  set userRequest(value) {
    _userRequest = value;
    notifyListeners();
  }
}
