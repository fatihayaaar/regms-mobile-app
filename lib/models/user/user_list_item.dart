import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list_item.g.dart';

@JsonSerializable()
class UserListItem with ChangeNotifier {
  String username;
  String? nameAndSurname;
  String? avatar;
  bool? isFollow;
  bool? isStory;

  UserListItem({
    required this.username,
    this.nameAndSurname,
    this.avatar,
    this.isFollow,
    this.isStory,
  });

  factory UserListItem.fromJson(Map<String, dynamic> json) =>
      _$UserListItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserListItemToJson(this);
}
