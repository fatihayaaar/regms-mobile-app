import 'package:json_annotation/json_annotation.dart';

import '../../core/models/base/base_network_model.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends BaseNetworkModel {
  String? avatar;
  String? nameAndSurname;
  String? bio;
  String? coverPhoto;
  int? followersCount;
  int? followingCount;

  Profile({
    this.avatar,
    this.nameAndSurname,
    this.bio,
    this.coverPhoto,
    this.followersCount,
    this.followingCount,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  fromJson(Map<String, Object> json) {
    return Profile.fromJson(json);
  }
}
