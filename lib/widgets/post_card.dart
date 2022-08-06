import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
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
      margin: const EdgeInsets.fromLTRB(0, 1, 0, 10),
      color: kThemeColor,
      child: Column(
        children: [
          SizedBox(height: 5),
          _buildPostCardHeader(),
          SizedBox(height: 5),
          _buildPostContent(),
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
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        "assets/images/dump_2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  _buildPostFooter() {
    return Container(
      child: Column(
        children: [
          _buildLikeStatus(),
          Container(
            child: Divider(color: kBorderColor, height: 1),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          ),
          _buildActions(),
          _buildComments(),
          _buildCommentTextField(),
        ],
      ),
    );
  }

  _buildPostActionText(text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "$text",
        style: kCommentRichTextStyle(
          kCommentTextColor,
          FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCommentTextField() {
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
            icon: heart,
            onClick: () {},
            text: "Like",
          ),
          _buildAction(
            icon: messages,
            onClick: () {},
            text: "Comment",
          ),
          _buildAction(
            icon: heart,
            onClick: () {},
            text: "Send",
          ),
          _buildAction(
            icon: messages,
            onClick: () {},
            text: "Save",
          ),
        ],
      ),
    );
  }

  _buildAction({String? text, required Widget icon, required void onClick()}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 15,
            child: icon,
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
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: RichText(
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Liked by ',
              style: kCommentRichTextStyle(
                kCommentTextColor,
                FontWeight.normal,
              ),
            ),
            TextSpan(
              text: '$likeCount',
              style: kCommentRichTextStyle(
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
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'fayar ',
                  style: kCommentRichTextStyle(
                    kCommentUsernameColor,
                    FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'hello, For code reusability, I have created a method named',
                  style: kCommentRichTextStyle(
                    kCommentTextColor,
                    FontWeight.normal,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
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
        _buildLikeText(),
      ],
    );
  }
}
