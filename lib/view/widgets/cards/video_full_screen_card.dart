import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/view/widgets/avatar.dart';
import 'package:video_player/video_player.dart';

class VideoFullScreenCard extends StatefulWidget {
  final Post post;
  final double volume;
  var controller;

  VideoFullScreenCard({
    Key? key,
    required this.post,
    this.volume = 1.0,
  }) : super(key: key);

  @override
  State<VideoFullScreenCard> createState() => _VideoFullScreenCardState(
        post: post,
        volume: volume,
      );
}

class _VideoFullScreenCardState extends State<VideoFullScreenCard> {
  final Post post;
  late VideoPlayerController controller;
  late double volume;

  _VideoFullScreenCardState({
    required this.post,
    required this.volume,
  });

  @override
  void initState() {
    controller = VideoPlayerController.asset(post.media ?? "");
    controller.initialize().then((value) {
      controller.play();
      controller.setLooping(true);
    });
    widget.controller = controller;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        Container(
          child: GestureDetector(
            onTap: () {
              volume = volume == 1.0 ? 0 : 1.0;
              controller.setVolume(volume);
            },
            child: VideoPlayer(controller),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: _buildActions(context),
        ),
        Positioned(
          bottom: 35,
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
        SizedBox(height: 10),
        _buildVideoProgressIndicator(context),
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
          overflow: TextOverflow.ellipsis,
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
            color: ColorSchemeLight.kFullScreenVideoIconColor,
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
        style: kActionRichTextStyle(Colors.white, FontWeight.normal),
      ),
    );
  }

  _buildListButton() {
    return Icon(
      Icons.keyboard_control_rounded,
      color: Colors.white,
    );
  }

  _buildVideoProgressIndicator(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 5,
        width: MediaQuery.of(context).size.width - 20,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          padding: EdgeInsets.zero,
          colors: VideoProgressColors(
            backgroundColor: Colors.transparent,
            playedColor: Colors.white.withOpacity(0.6),
            bufferedColor: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
