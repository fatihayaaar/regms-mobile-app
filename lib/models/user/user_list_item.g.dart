// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListItem _$UserListItemFromJson(Map<String, dynamic> json) => UserListItem(
      username: json['username'] as String,
      nameAndSurname: json['nameAndSurname'] as String?,
      avatar: json['avatar'] as String?,
      isFollow: json['isFollow'] as bool?,
      isStory: json['isStory'] as bool?,
    );

Map<String, dynamic> _$UserListItemToJson(UserListItem instance) =>
    <String, dynamic>{
      'username': instance.username,
      'nameAndSurname': instance.nameAndSurname,
      'avatar': instance.avatar,
      'isFollow': instance.isFollow,
      'isStory': instance.isStory,
    };
