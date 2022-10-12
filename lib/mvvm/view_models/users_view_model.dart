import 'package:flutter/material.dart';
import 'package:regms_flutter_client/mvvm/models/user/user_list_tile.dart';

class UsersViewModel with ChangeNotifier {
  List<UserListTile> _users = [
    UserListTile(
      username: 'fayar',
      avatar: "assets/images/dump_1.jpg",
      nameAndSurname: "Fatih Ayar",
      isFollow: false,
      isStory: true,
    ),
    UserListTile(
      username: 'berkcanoz',
      avatar: "assets/images/dump_2.jpg",
      nameAndSurname: "Berkercan",
      isFollow: false,
    ),
    UserListTile(
      username: 'damali',
      avatar: "assets/images/dump_2.jpg",
      isFollow: false,
    ),
    UserListTile(
      username: 'polat',
      avatar: "assets/images/dump_1.jpg",
      isFollow: false,
    ),
  ];

  UserListTile _userRequest = UserListTile(
    username: 'Follower Request',
    avatar: "assets/images/dump_1.jpg",
    nameAndSurname: "Approve or delete requests",
    isFollow: false,
  );

  List<UserListTile> get users => _users;

  set users(value) {
    _users = value;
    notifyListeners();
  }

  UserListTile get userRequest => _userRequest;

  set userRequest(value) {
    _userRequest = value;
    notifyListeners();
  }
}