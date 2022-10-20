import 'package:json_annotation/json_annotation.dart';
import 'package:regms_flutter_client/models/profile/profile.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  Profile profile;

  User({
    required this.username,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
