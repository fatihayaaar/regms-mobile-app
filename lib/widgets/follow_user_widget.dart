import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class FollowUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 10,
        horizontalTitleGap: 5,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: _buildAvatar(),
        title: _buildUsername(),
        subtitle: _buildStatus(),
        trailing: _buildAction(),
      ),
    );
  }

  _buildAvatar() {
    return Avatar(
      size: 28,
      borderColor: kThemeColor,
      img: 'assets/images/dump_1.jpg',
    );
  }

  _buildUsername() {
    return Text(
      "fayar",
      style: kUserListUsernameTextStyle,
    );
  }

  _buildStatus() {
    return Text(
      "Fatih Ayar",
      overflow: TextOverflow.ellipsis,
      style: kUserListStatusTextStyle,
    );
  }

  _buildAction() {
    return Container(
      width: 90,
      height: 25,
      decoration: BoxDecoration(
        color: kAppbarColor,
        border: Border.all(color: kThemeColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: kTransparentButtonButtonStyle,
        child: Text("Follow"),
      ),
    );
  }
}
