import 'package:flutter/material.dart';

class UserMessageListTile with ChangeNotifier {
  String username;
  String? nameAndSurname;
  String? avatar;
  bool? isFollow;
  bool? isStory;
  String? messageContent;
  int? newMessageCount;
  String? date;

  UserMessageListTile({
    required this.username,
    this.nameAndSurname,
    this.avatar,
    this.isFollow,
    this.isStory,
    this.messageContent,
    this.newMessageCount,
    this.date
  });
}