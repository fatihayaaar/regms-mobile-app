import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/silver_app_bar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/post_card.dart';
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
          text: "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
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
        text:
        "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
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
          text: "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
        media: "assets/images/dump_2.jpg",
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
            0, 40 + MediaQuery
            .of(context)
            .viewPadding
            .top, 0, 0),
        alignment: Alignment.centerLeft,
        child: Stack(
          children: [
            _buildProfileHeader(),
            _buildProfileActions(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(),
                  _buildNameAndSurname(),
                  SizedBox(height: 5),
                  _buildBio(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileFollowersText(
                          text: "Followers", count: "9.2M"),
                      SizedBox(width: 15),
                      _buildProfileFollowersText(text: "Following", count: "1"),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Image.asset(
      "assets/images/dump_2.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
      height: 100,
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.centerLeft,
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "assets/images/dump_1.jpg",
        size: 35,
      ),
    );
  }

  _buildNameAndSurname() {
    return Text(
      "Fatih Ayar",
      style: kNameAndSurnameTextStyle,
    );
  }

  _buildBio() {
    return Text(
      "Software Developer ;) fayardev founder",
      style: kBioTextStyle,
    );
  }

  Widget _buildProfileActions() {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.fromLTRB(0, 110, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildProfileEditButton("Edit", () {
            Route route =
            MaterialPageRoute(builder: (_) => EditProfileScreen());
            Navigator.push(context, route);
          }),
        ],
      ),
    );
  }

  Widget _buildProfileEditButton(String text, void onClick()) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 33,
      child: ElevatedButton(
        style: kProfileButtonButtonStyle,
        onPressed: onClick,
        child: Text(
          text,
          style: kProfileButtonContentTextStyle,
        ),
      ),
    );
  }

  Widget _buildProfileFollowersText(
      {required String text, required String count}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Text(
            count,
            style: kFollowersCountSizeTextStyle,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: kFollowersCountTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return TabBarView(
      children: [
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
      ],
    );
  }

  Widget _buildPosts() {
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
