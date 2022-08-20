import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/post_card.dart';
import 'package:regms_flutter_client/widgets/story_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final List<PostCard> posts = [
    PostCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 920,
        commentCount: 10,
        text:
            "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          text:
              "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
        media: "assets/images/dump_2.jpg",
      ),
    ),
    PostCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 920,
        commentCount: 0,
        sendDate: "3s",
        media: "assets/images/dump_2.jpg",
      ),
    ),
    PostCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 9220,
        commentCount: 0,
        text:
            "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          text:
              "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Home", backButtonVisibility: false),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        Container(
          height: 30,
          color: kAppbarColor,
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          child: buildContent(),
        ),
      ],
    );
  }

  buildContent() {
    return Container(
      color: kBorderColor,
      child: _buildPostView(),
    );
  }

  _buildPostView() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            StoryList(list: []),
            ListView.builder(
              padding: EdgeInsets.all(0),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return posts.elementAt(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
