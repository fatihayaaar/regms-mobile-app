import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../models/user/user_list_item.dart';
import '../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../avatar.dart';

class FollowUserTile extends StatelessWidget {
  final UserListItem user;

  const FollowUserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(10, 5, 15, 5),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 10,
        horizontalTitleGap: 5,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: _buildAvatar(),
        title: _buildTitle(),
        trailing: _buildAction(),
      ),
    );
  }

  _buildAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: Avatar(
        size: 20,
        borderColor: Colors.white,
        img: user.avatar ?? "",
        isStory: user.isStory ?? false,
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

  _buildAction() {
    return Container(
      width: 80,
      height: 25,
      decoration: BoxDecoration(
        color: ColorSchemeLight.kThemeColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: kTransparentButtonButtonStyle,
        child: Text(
          "Follow",
          style: kUserListActionTextStyle,
        ),
      ),
    );
  }
}
