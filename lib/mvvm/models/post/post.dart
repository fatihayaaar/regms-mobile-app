import 'package:regms_flutter_client/mvvm/models/comment/comment.dart';
import 'package:regms_flutter_client/mvvm/models/user/user.dart';

class Post {
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
