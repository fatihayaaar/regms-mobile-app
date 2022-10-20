import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user_list_item.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/feature/widgets/avatar.dart';

class UserTile extends StatelessWidget {
  final UserListItem user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 5, 15, 5),
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
      margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
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
    return Icon(
      Icons.keyboard_control_rounded,
      color: ColorSchemeLight.kBodyTextColor.withOpacity(0.5),
    );
  }
}
