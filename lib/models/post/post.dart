import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/models/base/base_network_model.dart';
import '../comment/comment.dart';
import '../user/user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends BaseNetworkModel with ChangeNotifier {
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

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}
