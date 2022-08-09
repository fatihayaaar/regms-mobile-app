// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/comment_box.dart';

class PostCard extends StatefulWidget {
  final Post post;

  PostCard({
    required this.post,
  });

  @override
  State<StatefulWidget> createState() => _PostCardState(post: post);
}

class _PostCardState extends State {
  Post post;

  _PostCardState({
    required this.post,
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
        img: "${post.user.avatar}",
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
              SizedBox(width: 7),
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
      "${post.user.username}",
      style: kPostUsernameTextStyle,
    );
  }

  _buildPostContent() {
    return Visibility(
      visible: post.text == "" ? false : true,
      child: Container(
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 7),
        child: Text(
          "${post.text}",
          style: kPostContentTextStyle,
        ),
      ),
    );
  }

  _buildPostMedia() {
    return Image.asset(
      "${post.media}",
      fit: BoxFit.cover,
    );
  }

  _buildPostFooter() {
    return Column(
      children: [
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
        style: kActionRichTextStyle(kPostActionTextColor, FontWeight.normal),
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
            img: "${post.user.avatar}",
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
            text: "${post.likeCount}",
          ),
          SizedBox(width: 20),
          _buildAction(
            icon: (Icons.send),
            onClick: () {},
          ),
          Expanded(child: Container()),
          _buildAction(
            icon: (Icons.bookmark_border),
            onClick: () {},
          ),
        ],
      ),
    );
  }

  _buildAction(
      {String? text, required IconData icon, required void onClick()}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 25,
            color: kCommentActionIconColor,
          ),
        ),
        SizedBox(width: 5),
        Visibility(
          visible: text == null ? false : true,
          child: _buildPostActionText(text),
        ),
      ],
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
          "${post.sendDate}",
          style: kTimeTextStyle,
        ),
      ],
    );
  }

  _buildComments() {
    return post.comment == null
        ? Container()
        : CommentBox(
            comment: post.comment!,
            detailText: post.commentCount > 0 ? "${post.commentCount}" : null,
          );
  }
}
