import 'package:flutter/material.dart';

import '../../../models/user/user_list_item.dart';

class UsersViewModel with ChangeNotifier {
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
