import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

// ignore: must_be_immutable
class PostCard extends StatefulWidget {
  String? username;
  String? contentText;
  String? avatar;
  String? likeCount;
  String? commentCount;

  PostCard({
    this.username = "",
    this.contentText = "",
    this.avatar = "assets/images/dump_1.jpg",
    this.likeCount = "0",
    this.commentCount = "0",
  });

  @override
  State<StatefulWidget> createState() => _PostCardState(
    username: username,
    contentText: contentText,
    avatar: avatar,
    likeCount: likeCount,
    commentCount: commentCount,
  );
}

class _PostCardState extends State {
  String? username;
  String? contentText;
  String? avatar;
  String? likeCount;
  String? commentCount;

  _PostCardState({
    this.username,
    this.contentText,
    this.avatar,
    this.likeCount,
    this.commentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Divider(color: kBorderColor, height: 1),
          SizedBox(height: 5),
          _buildPostCardHeader(),
          SizedBox(height: 5),
          _buildPostContent(),
          _buildPostMedia(),
          _buildPostFooter(),
        ],
      ),
    );
  }

  _buildPostAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "$avatar",
        size: 20,
      ),
    );
  }

  _buildPostCardHeader() {
    return Row(
      children: [
        _buildPostAvatar(),
        SizedBox(width: 7),
        _buildPostUsername(),
      ],
    );
  }

  _buildPostUsername() {
    return Text(
      "$username",
      style: kPostUsernameTextStyle,
    );
  }

  _buildPostContent() {
    return Visibility(
      visible: contentText == "" ? false : true,
      child: Container(
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 7),
        child: Text(
          "$contentText",
          style: kPostContentTextStyle,
        ),
      ),
    );
  }

  _buildPostMedia() {
    return AspectRatio(
      aspectRatio: 1080 / 800,
      child: Container(
        color: Colors.amber,
        child: Center(child: Text('Entry')),
      ),
    );
  }

  _buildPostFooter() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 7, 0, 7),
            child: Row(
              children: [
                _buildPostLikesText(),
                SizedBox(width: 10),
                _buildPostCommentText(),
              ],
            ),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }

  _buildPostLikesText() {
    return Text(
      "$likeCount Likes",
      style: kPostCountTextStyle,
    );
  }

  _buildPostCommentText() {
    return Text(
      "$commentCount Comment",
      style: kPostCountTextStyle,
    );
  }
}
