import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:regms_flutter_client/models/comment/comment.dart';
import 'package:regms_flutter_client/models/user/user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post with ChangeNotifier {
  User user;
  String? text;
  int likeCount;
  int commentCount;
  String sendDate;
  Comment? comment;
  String? media;

  Post({
    required this.user,
    this.text,
    required this.likeCount,
    required this.commentCount,
    this.comment,
    this.media,
    required this.sendDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
