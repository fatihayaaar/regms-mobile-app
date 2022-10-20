import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user_message_item.dart';
import 'package:regms_flutter_client/feature/widgets/avatar.dart';

class UserMessageTile extends StatelessWidget {
  final UserMessageItem user;

  UserMessageTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 1 / 5,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            foregroundColor: Colors.white,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
        padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
        child: Row(
          children: [
            _buildAvatar(),
            SizedBox(width: 3),
            _buildMessageContent(),
            _buildStatus(),
          ],
        ),
      ),
    );
  }

  _buildAvatar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Avatar(
        size: 24,
        borderColor: Colors.white,
        img: "${user.avatar}",
        isStory: user.isStory ?? false,
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
          _buildUsername(),
          SizedBox(height: 2),
          _buildMessage(),
        ],
      ),
    );
  }

  _buildUsername() {
    return Text(
      "${user.username}",
      style: kUserListUsernameMessageTextStyle(user.newMessageCount == null
          ? false
          : user.newMessageCount! > 0
              ? true
              : false),
    );
  }

  _buildPostDate() {
    return Container(
      width: 40,
      alignment: Alignment.center,
      child: Text(
        "${user.date}",
        style: kTimeMessageTextStyle(user.newMessageCount == null
            ? false
            : user.newMessageCount! > 0
                ? true
                : false),
      ),
    );
  }

  _buildMessage() {
    return Text(
      "${user.messageContent}",
      style: kUserListMessageTextStyle(user.newMessageCount == null
          ? false
          : user.newMessageCount! > 0
              ? true
              : false),
      overflow: TextOverflow.ellipsis,
    );
  }

  _buildStatus() {
    return Column(
      children: [
        _buildPostDate(),
        Visibility(
          visible: user.newMessageCount == null
              ? false
              : user.newMessageCount! > 0
                  ? true
                  : false,
          child: SizedBox(height: 5),
        ),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    "${user.newMessageCount}",
                    style: kUserListActionTextStyle,
                  ),
                ),
              )
            : Container();
  }
}
