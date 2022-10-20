// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      sendTime: json['sendTime'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'user': instance.user,
      'sendTime': instance.sendTime,
      'text': instance.text,
    };
