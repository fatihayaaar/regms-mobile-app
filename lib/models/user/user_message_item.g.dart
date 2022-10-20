// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageItem _$UserMessageItemFromJson(Map<String, dynamic> json) =>
    UserMessageItem(
      username: json['username'] as String,
      nameAndSurname: json['nameAndSurname'] as String?,
      avatar: json['avatar'] as String?,
      isFollow: json['isFollow'] as bool?,
      isStory: json['isStory'] as bool?,
      messageContent: json['messageContent'] as String?,
      newMessageCount: json['newMessageCount'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$UserMessageItemToJson(UserMessageItem instance) =>
    <String, dynamic>{
      'username': instance.username,
      'nameAndSurname': instance.nameAndSurname,
      'avatar': instance.avatar,
      'isFollow': instance.isFollow,
      'isStory': instance.isStory,
      'messageContent': instance.messageContent,
      'newMessageCount': instance.newMessageCount,
      'date': instance.date,
    };
