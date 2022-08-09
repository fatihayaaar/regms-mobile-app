// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class CommentBox extends StatefulWidget {
  String? detailText;
  Comment comment;

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
        img: "${comment.avatar}",
        size: 14,
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
                SizedBox(width: 3),
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

  _buildCommentBoxUsername() {
    return Text(
      '${comment.username} ',
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
      "10sn",
      style: kCommentTimeTextStyle,
    );
  }

  _buildDetail() {
    return Visibility(
      visible: detailText == null ? false : true,
      child: detailText != null ? Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(45, 4, 0, 4),
        child: Text(
          detailText!,
          style: kCommentRichTextStyle(
            kBodyTextColor,
            FontWeight.normal,
          ),
          textAlign: TextAlign.left,
        ),
      ) : Container(),
    );
  }
}
