import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
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

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
