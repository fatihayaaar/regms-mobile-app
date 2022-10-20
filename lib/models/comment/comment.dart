import 'package:json_annotation/json_annotation.dart';
import 'package:regms_flutter_client/models/user/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  User user;
  String sendTime;
  String text;

  Comment({
    required this.user,
    required this.sendTime,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
