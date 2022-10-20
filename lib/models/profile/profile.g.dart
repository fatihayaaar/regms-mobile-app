// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      avatar: json['avatar'] as String?,
      nameAndSurname: json['nameAndSurname'] as String?,
      bio: json['bio'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      followersCount: json['followersCount'] as int?,
      followingCount: json['followingCount'] as int?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'nameAndSurname': instance.nameAndSurname,
      'bio': instance.bio,
      'coverPhoto': instance.coverPhoto,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
    };
