import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/widgets/app_bar/silver_app_bar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/post_card.dart';
import 'package:regms_flutter_client/widgets/profile_card.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
  final List<PostCard> posts = [
    PostCard(
      post: Post(
        user: User(username: "fayar", avatar: "assets/images/dump_1.jpg"),
        likeCount: 920,
        commentCount: 10,
        text:
            "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(username: "fayar", avatar: "assets/images/dump_1.jpg"),
          text:
              "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
        media: "assets/images/dump_2.jpg",
      ),
    ),
    PostCard(
      post: Post(
        user: User(username: "fayar", avatar: "assets/images/dump_1.jpg"),
        likeCount: 920,
        commentCount: 0,
        sendDate: "3s",
        media: "assets/images/dump_2.jpg",
      ),
    ),
    PostCard(
      post: Post(
        user: User(username: "fayar", avatar: "assets/images/dump_1.jpg"),
        likeCount: 9220,
        commentCount: 0,
        text:
            "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(username: "fayar", avatar: "assets/images/dump_1.jpg"),
          text:
              "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _buildBody(),
        endDrawer: buildDrawer(context: context),
        bottomNavigationBar: BottomNavBar(selected: -2),
      ),
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: _buildContent(),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          buildSilverApp(_buildProfileContent(), "fayar", context),
        ];
      },
    );
  }

  Widget _buildProfileContent() {
    return FlexibleSpaceBar(
      background: Container(
        color: kThemeColor,
        margin: EdgeInsets.fromLTRB(
            0, 40 + MediaQuery.of(context).viewPadding.top, 0, 0),
        alignment: Alignment.centerLeft,
        child: ProfileCard(),
      ),
    );
  }

  _buildContent() {
    return TabBarView(
      children: [
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
      ],
    );
  }

  _buildPosts() {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: Container(
        color: kBorderColor,
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return posts.elementAt(index);
            }),
      ),
    );
  }
}
