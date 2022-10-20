// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      text: json['text'] as String?,
      likeCount: json['likeCount'] as int,
      commentCount: json['commentCount'] as int,
      comment: json['comment'] == null
          ? null
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
      media: json['media'] as String?,
      sendDate: json['sendDate'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'user': instance.user,
      'text': instance.text,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'sendDate': instance.sendDate,
      'comment': instance.comment,
      'media': instance.media,
    };
