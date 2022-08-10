import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class CommentBox extends StatefulWidget {
  final String? detailText;
  final Comment comment;

  CommentBox({this.detailText, required this.comment});

  @override
  State<StatefulWidget> createState() => _CommentBoxState(detailText, comment);
}

class _CommentBoxState extends State {
  String? detailText;
  Comment comment;

  _CommentBoxState(this.detailText, this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "${comment.user.avatar}",
        size: 14,
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
                SizedBox(width: 5),
                _buildCommentBoxTime(),
              ],
            ),
            SizedBox(height: 4),
            _buildCommentBoxText(),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  _buildCommentBoxUsername() {
    return Text(
      '${comment.user.username}',
      style: kCommentRichTextStyle(
        kCommentUsernameColor,
        FontWeight.bold,
      ),
    );
  }

  _buildCommentBoxText() {
    return Text(
      '${comment.text}',
      style: kCommentRichTextStyle(
        kCommentTextColor,
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
                  kBodyTextColor,
                  FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            )
          : Container(),
    );
  }
}
