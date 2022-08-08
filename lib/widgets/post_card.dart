import 'package:flutter/gestures.dart';
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
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      color: kThemeColor,
      child: Column(
        children: [
          SizedBox(height: 5),
          _buildPostCardHeader(),
          SizedBox(height: 5),
          _buildPostContent(),
          SizedBox(height: 5),
          _buildPostMedia(),
          _buildPostFooter(),
          SizedBox(height: 10),
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
        Expanded(
          child: Row(
            children: [
              _buildPostAvatar(),
              SizedBox(width: 7),
              _buildPostUsername(),
              SizedBox(width: 10),
              _buildPostDate(),
            ],
          ),
        ),
        _buildPopMenu(),
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
    return InteractiveViewer(
      panEnabled: true, // Set it to false to prevent panning.
      boundaryMargin: EdgeInsets.all(80),
      minScale: 1,
      maxScale: 4,
      child: Image.asset(
        "assets/images/dump_2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  _buildPostFooter() {
    return Column(
      children: [
        _buildLikeStatus(),
        Container(
          child: Divider(color: kBorderColor, height: 0),
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
        _buildActions(),
        _buildComments(),
        _buildCommentTextField(),
      ],
    );
  }

  _buildPostActionText(text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "$text",
        style: kActionRichTextStyle(
          kCommentTextColor,
          FontWeight.bold,
        ),
      ),
    );
  }

  _buildCommentTextField() {
    return Row(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: buildAvatar(
            borderColor: Colors.white.withOpacity(1),
            img: "$avatar",
            size: 15,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: TextFormField(
              textInputAction: TextInputAction.go,
              maxLines: 1,
              onFieldSubmitted: (term) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return "* Required";
                } else
                  return null;
              },
              decoration:
                  kCommentTextFieldInputDecoration("send your comment..."),
            ),
          ),
        ),
      ],
    );
  }

  _buildActions() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAction(
            icon: (Icons.thumb_up_alt_outlined),
            onClick: () {},
            text: "Like",
          ),
          _buildAction(
            icon: (Icons.chat_outlined),
            onClick: () {},
            text: "Comment",
          ),
          _buildAction(
            icon: (Icons.send),
            onClick: () {},
            text: "Send",
          ),
          _buildAction(
            icon: (Icons.bookmark_border),
            onClick: () {},
            text: "Save",
          ),
        ],
      ),
    );
  }

  _buildAction(
      {String? text, required IconData icon, required void onClick()}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              icon,
              size: 18,
              color: kCommentTextColor,
            ),
          ),
          Visibility(
            visible: text == null ? false : true,
            child: _buildPostActionText(text),
          ),
        ],
      ),
    );
  }

  _buildLikeText() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: RichText(
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Liked by ',
              style: kLikeRichTextStyle(
                kCommentTextColor,
                FontWeight.normal,
              ),
            ),
            TextSpan(
              text: '$likeCount',
              style: kLikeRichTextStyle(
                kCommentUsernameColor,
                FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' users ',
              style: kCommentRichTextStyle(
                kCommentTextColor,
                FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPopMenu() {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_horiz,
        color: kNameAndSurnameColor,
      ),
      itemBuilder: (ctx) => [
        _buildPopupMenuItem("Delete"),
        _buildPopupMenuItem("Edit"),
      ],
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      child: Text(title),
    );
  }

  _buildComments() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCommentAvatar(),
              _buildCommentBox(),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(45, 4, 0, 4),
            child: Text(
              "See all $commentCount comments",
              style: kCommentRichTextStyle(
                kBodyTextColor,
                FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  _buildPostDate() {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 12,
          color: kBodyTextColor,
        ),
        SizedBox(width: 3),
        Text(
          "3s",
          style: kTimeTextStyle,
        ),
      ],
    );
  }

  _buildLikeStatus() {
    return Row(
      children: [
        _buildLikeAvatars(),
        _buildLikeText(),
      ],
    );
  }

  _buildLikeAvatars() {
    return Container(
      width: 60,
      height: 20,
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 32,
            child: _buildLikeAvatar(),
          ),
          Positioned(
            top: 0,
            left: 16,
            child: _buildLikeAvatar(),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: _buildLikeAvatar(),
          ),
        ],
      ),
    );
  }

  _buildLikeAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "$avatar",
        size: 9,
      ),
    );
  }

  _buildCommentBox() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: kCommentBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCommentBoxUsername(),
                _buildCommentBoxTime(),
              ],
            ),
            SizedBox(height: 4),
            _buildCommentBoxText(),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  _buildCommentAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "$avatar",
        size: 14,
      ),
    );
  }

  _buildCommentBoxUsername() {
    return Text(
      'fayar ',
      style: kCommentRichTextStyle(
        kCommentUsernameColor,
        FontWeight.bold,
      ),
    );
  }

  _buildCommentBoxText() {
    return Text(
      'hello, For code reusability, I have created a method named',
      style: kCommentRichTextStyle(
        kCommentTextColor,
        FontWeight.normal,
      ),
    );
  }

  _buildCommentBoxTime() {
    return Text(
      "10sn",
      style: kCommentTimeTextStyle,
    );
  }
}
