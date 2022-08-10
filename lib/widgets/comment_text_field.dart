import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class CommentTextField extends StatefulWidget {
  final String? avatar;

  CommentTextField({this.avatar});

  @override
  State<StatefulWidget> createState() => _CommentTextFieldState(avatar);
}

class _CommentTextFieldState extends State {
  String? avatar;

  _CommentTextFieldState(this.avatar);

  @override
  Widget build(BuildContext context) {
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
}
