import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/user.dart';

class Post {
  User user;
  String text;
  int likeCount;
  int commentCount;
  String sendDate;
  Comment? comment;
  String media;

  Post({
    required this.user,
    required this.text,
    required this.likeCount,
    required this.commentCount,
    this.comment,
    required this.media,
    required this.sendDate,
  });
}
