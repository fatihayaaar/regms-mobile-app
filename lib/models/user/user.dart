import 'package:json_annotation/json_annotation.dart';

import '../../core/models/base/base_network_model.dart';
import '../profile/profile.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseNetworkModel {
  String username;
  late Profile profile;

  User({
    required this.username,
    required this.profile,
  });

  User.empty({this.username = ""}) {
    profile = Profile();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}
