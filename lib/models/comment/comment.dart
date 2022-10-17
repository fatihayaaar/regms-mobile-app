import 'package:regms_flutter_client/models/user/user.dart';

class Comment {
  User user;
  String sendTime;
  String text;

  Comment({
    required this.user,
    required this.sendTime,
    required this.text,
  });
}
