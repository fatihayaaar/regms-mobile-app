import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class VideoFullScreenCard extends StatelessWidget {
  final Post post;

  VideoFullScreenCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: _buildContent(context),
    );
  }

  _buildContent(context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          left: 10,
          child: _buildActions(context),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: _buildListButton(),
        ),
      ],
    );
  }

  _buildActions(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileAction(context),
        SizedBox(height: 10),
        _buildVideoAction(),
      ],
    );
  }

  _buildProfileAction(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildAvatar(),
            SizedBox(width: 7.5),
            _buildUsername(),
          ],
        ),
        SizedBox(height: 5),
        _buildPostContent(context),
      ],
    );
  }

  _buildAvatar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Avatar(
        borderColor: Colors.white.withOpacity(0.5),
        img: "${post.user.profile.avatar}",
        size: 15,
      ),
    );
  }

  _buildUsername() {
    return Text(
      "${post.user.username}",
      style: kFullScreenVideoUsernameTextStyle,
    );
  }

  _buildPostContent(context) {
    return Visibility(
      visible: post.text == null
          ? false
          : post.text == ""
              ? false
              : true,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        margin: const EdgeInsets.fromLTRB(0, 3, 10, 7),
        child: Text(
          "${post.text}",
          style: kFullScreenVideoContentTextStyle,
        ),
      ),
    );
  }

  _buildVideoAction() {
    return Row(
      children: [
        _buildAction(
          icon: (Icons.favorite_border),
          onClick: () {},
          text: post.likeCount > 0 ? "${post.likeCount}" : null,
        ),
        SizedBox(width: 20),
        _buildAction(
          icon: (Icons.messenger_outline),
          onClick: () {},
          text: post.commentCount > 0 ? "${post.commentCount}" : null,
        ),
      ],
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
            color: kFullScreenVideoIconColor,
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

  _buildPostActionText(text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "$text",
        style: kActionRichTextStyle(kThemeColor, FontWeight.normal),
      ),
    );
  }

  _buildListButton() {
    return Icon(
      Icons.keyboard_control_rounded,
      color: kThemeColor,
    );
  }
}
