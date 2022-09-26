import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user_message_list_tile.dart';
import 'package:regms_flutter_client/views/widgets/avatar.dart';

class UserMessageTile extends StatelessWidget {
  final UserMessageListTile user;

  UserMessageTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
      padding: EdgeInsets.fromLTRB(15, 2.5, 15, 2.5),
      decoration: BoxDecoration(
        color: user.newMessageCount == null
            ? Colors.transparent
            : user.newMessageCount == 0
                ? Colors.transparent
                : Colors.grey.withOpacity(0.03),
      ),
      child: Row(
        children: [
          _buildAvatar(),
          SizedBox(width: 3),
          _buildMessageContent(),
          _buildStatus(),
        ],
      ),
    );
  }

  _buildAvatar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Avatar(
        size: 27,
        borderColor: Colors.white,
        img: "${user.avatar}",
      ),
    );
  }

  _buildMessageContent() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              _buildUsername(),
              SizedBox(width: 7),
              _buildPostDate(),
            ],
          ),
          SizedBox(height: 2),
          _buildMessage(),
        ],
      ),
    );
  }

  _buildUsername() {
    return Text(
      "${user.username}",
      style: kUserListUsernameMessageTextStyle,
    );
  }

  _buildPostDate() {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 10,
          color: kBodyTextColor,
        ),
        SizedBox(width: 3),
        Text(
          "${user.date}",
          style: kTimeMessageTextStyle,
        ),
      ],
    );
  }

  _buildMessage() {
    return Text(
      "${user.messageContent}",
      style: kUserListStatusTextStyle,
      overflow: TextOverflow.ellipsis,
    );
  }

  _buildStatus() {
    return Column(
      children: [
        _buildCount(),
      ],
    );
  }

  _buildCount() {
    return user.newMessageCount == null
        ? Container()
        : user.newMessageCount! > 0
            ? Container(
                height: 20,
                width: 40,
                alignment: Alignment.center,
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  child: Text("${user.newMessageCount}",
                      style: kUserListActionTextStyle),
                ),
              )
            : Container();
  }
}
