import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../models/comment/comment.dart';
import '../product/theme/theme_mode/light/color_scheme_light.dart';
import 'avatar.dart';

class CommentBox extends StatelessWidget {
  final String? detailText;
  final Comment comment;

  const CommentBox({
    super.key,
    this.detailText,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
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
          _buildDetail(),
        ],
      ),
    );
  }

  _buildCommentAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Avatar(
        borderColor: Colors.white.withOpacity(1),
        img: "${comment.user.profile.avatar}",
        size: 15,
      ),
    );
  }

  _buildCommentBox() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 2, 0, 2),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: kCommentBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCommentBoxUsername(),
                const SizedBox(width: 5),
                _buildCommentBoxTime(),
              ],
            ),
            const SizedBox(height: 4),
            _buildCommentBoxText(),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  _buildCommentBoxUsername() {
    return Text(
      comment.user.username,
      style: kCommentRichTextStyle(
        ColorSchemeLight.kCommentUsernameColor,
        FontWeight.bold,
      ),
    );
  }

  _buildCommentBoxText() {
    return Text(
      comment.text,
      style: kCommentRichTextStyle(
        ColorSchemeLight.kCommentTextColor,
        FontWeight.normal,
      ),
    );
  }

  _buildCommentBoxTime() {
    return Text(
      comment.sendTime,
      style: kCommentTimeTextStyle,
    );
  }

  _buildDetail() {
    return Visibility(
      visible: detailText == null ? false : true,
      child: detailText != null
          ? Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(45, 4, 0, 4),
              child: Text(
                "See ${detailText!} comment",
                style: kCommentRichTextStyle(
                  ColorSchemeLight.kBodyTextColor,
                  FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            )
          : Container(),
    );
  }
}
