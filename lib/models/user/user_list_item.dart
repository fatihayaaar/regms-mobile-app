import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/models/base/base_network_model.dart';

part 'user_list_item.g.dart';

@JsonSerializable()
class UserListItem extends BaseNetworkModel with ChangeNotifier {
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

  @override
  Map<String, dynamic> toJson() => _$UserListItemToJson(this);

  @override
  fromJson(Map<String, Object> json) {
    return UserListItem.fromJson(json);
  }
}
