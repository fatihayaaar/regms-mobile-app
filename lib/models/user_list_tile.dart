class UserListTile {
  String username;
  String? nameAndSurname;
  String? avatar;
  bool isFollow;
  bool? isStory;

  UserListTile({
    required this.username,
    this.nameAndSurname,
    this.avatar,
    required this.isFollow,
    this.isStory,
  });
}
