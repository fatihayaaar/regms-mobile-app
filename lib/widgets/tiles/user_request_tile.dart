import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../models/user/user_list_item.dart';
import '../avatar.dart';

class UserRequestTile extends StatelessWidget {
  final UserListItem user;

  const UserRequestTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 7, 15, 7),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 10,
        horizontalTitleGap: 5,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: _buildAvatar(),
        title: _buildTitle(),
        trailing: _buildCount(),
      ),
    );
  }

  _buildAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      width: 54,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Avatar(
              size: 17,
              borderColor: Colors.white,
              img: user.avatar ?? "",
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Avatar(
              size: 17,
              borderColor: Colors.white,
              img: user.avatar ?? "",
            ),
          ),
        ],
      ),
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildUsername(),
        _buildNameAndSurname(),
      ],
    );
  }

  _buildUsername() {
    return Text(
      user.username,
      style: kUserListUsernameTextStyle,
    );
  }

  _buildNameAndSurname() {
    return Visibility(
      visible: user.nameAndSurname == null ? false : true,
      child: Text(
        user.nameAndSurname ?? "",
        overflow: TextOverflow.ellipsis,
        style: kUserListStatusTextStyle,
      ),
    );
  }

  _buildCount() {
    return Container(
      height: 20,
      width: 40,
      alignment: Alignment.center,
      child: Container(
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Text("5", style: kUserListActionTextStyle),
      ),
    );
  }
}
