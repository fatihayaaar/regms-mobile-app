import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'avatar.dart';

class CommentTextField extends StatelessWidget {
  final String? avatar;

  const CommentTextField({
    super.key,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(),
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
                } else {
                  return null;
                }
              },
              decoration: kCommentTextFieldInputDecoration("send your comment..."),
            ),
          ),
        ),
      ],
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Avatar(
        borderColor: Colors.white.withOpacity(1),
        img: "$avatar",
        size: 15,
      ),
    );
  }
}
