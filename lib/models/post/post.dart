import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/comment/comment.dart';
import 'package:regms_flutter_client/models/user/user.dart';

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
}
