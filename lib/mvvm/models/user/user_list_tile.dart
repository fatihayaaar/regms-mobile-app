import 'package:flutter/material.dart';

class UserListTile with ChangeNotifier {
  String username;
  String? nameAndSurname;
  String? avatar;
  bool? isFollow;
  bool? isStory;

  UserListTile({
    required this.username,
    this.nameAndSurname,
    this.avatar,
    this.isFollow,
    this.isStory,
  });
}
