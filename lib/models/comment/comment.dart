import 'package:json_annotation/json_annotation.dart';

import '../../core/models/base/base_network_model.dart';
import '../user/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment extends BaseNetworkModel {
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

  @override
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}
