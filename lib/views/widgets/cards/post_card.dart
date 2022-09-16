import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/post/post.dart';
import 'package:regms_flutter_client/views/widgets/avatar.dart';
import 'package:regms_flutter_client/views/widgets/bottom_sheet.dart';
import 'package:regms_flutter_client/views/widgets/comment_box.dart';
import 'package:regms_flutter_client/views/widgets/comment_text_field.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final context;
  final bool isCommentVisible;

  PostCard({
    required this.post,
    required this.context,
    this.isCommentVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: kThemeColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          _buildPostCardHeader(),
          _buildPostContent(),
          _buildPostMedia(),
          SizedBox(height: 5),
          _buildPostFooter(),
          SizedBox(height: isCommentVisible ? 5 : 0),
        ],
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
              SizedBox(width: 4),
              _buildPostUsername(),
              SizedBox(width: 7),
              _buildPostDate(),
            ],
          ),
        ),
        _buildSheetBottomMenuOpenClick(),
      ],
    );
  }

  _buildPostAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Avatar(
        borderColor: Colors.white.withOpacity(1),
        img: "${post.user.profile.avatar}",
        size: 15,
      ),
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
      visible: post.text == null
          ? false
          : post.text == ""
              ? false
              : true,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 3, 10, 7),
        child: Text(
          "${post.text}",
          style: kPostContentTextStyle,
        ),
      ),
    );
  }

  _buildPostMedia() {
    return post.media == null
        ? Container()
        : Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Container(
                child: Image.asset(
                  "${post.media}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }

  _buildPostFooter() {
    return Column(
      children: [
        _buildActions(),
        Visibility(
          visible: isCommentVisible,
          child: Column(
            children: [
              _buildComments(),
              SizedBox(height: post.commentCount == 0 ? 5 : 0),
              CommentTextField(avatar: post.user.profile.avatar),
            ],
          ),
        ),
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

  _buildActions() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAction(
            icon: (Icons.favorite_border),
            onClick: () {},
            text: post.likeCount > 0 ? "${post.likeCount}" : null,
          ),
          SizedBox(width: 15),
          _buildAction(
            icon: (Icons.messenger_outline),
            onClick: () {},
            text: post.commentCount > 0 ? "${post.commentCount}" : null,
          ),
          Expanded(child: Container()),
          _buildAction(
            icon: (Icons.ios_share),
            onClick: () {},
          ),
          SizedBox(width: 15),
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
            size: 20,
            color: kCommentActionIconColor,
          ),
        ),
        Visibility(
          visible: text == null ? false : true,
          child: SizedBox(width: 5),
        ),
        Visibility(
          visible: text == null ? false : true,
          child: _buildPostActionText(text),
        ),
      ],
    );
  }

  _buildSheetBottomMenuOpenClick() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          context: context,
          builder: (_) => BottomSheetWidget(),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(
          Icons.keyboard_control_rounded,
          color: kBodyTextColor,
        ),
      ),
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