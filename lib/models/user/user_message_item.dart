import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_message_item.g.dart';

@JsonSerializable()
class UserMessageItem with ChangeNotifier {
  String username;
  String? nameAndSurname;
  String? avatar;
  bool? isFollow;
  bool? isStory;
  String? messageContent;
  int? newMessageCount;
  String? date;

  UserMessageItem({
    required this.username,
    this.nameAndSurname,
    this.avatar,
    this.isFollow,
    this.isStory,
    this.messageContent,
    this.newMessageCount,
    this.date,
  });

  factory UserMessageItem.fromJson(Map<String, dynamic> json) =>
      _$UserMessageItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessageItemToJson(this);
}
