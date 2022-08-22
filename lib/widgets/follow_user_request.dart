import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user_list_tile.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class FollowUserRequest extends StatelessWidget {
  final UserListTile user;

  FollowUserRequest({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 7, 15, 7),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 10,
        horizontalTitleGap: 5,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: _buildAvatar(),
        title: _buildTitle(),
      ),
    );
  }

  _buildAvatar() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      width: 54,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Avatar(
              size: 17,
              borderColor: kThemeColor,
              img: user.avatar ?? "",
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Avatar(
              size: 17,
              borderColor: kThemeColor,
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
}
