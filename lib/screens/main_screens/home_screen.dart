import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/story_list_item.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/cards/post_card.dart';
import 'package:regms_flutter_client/widgets/story_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  List<PostCard> posts = [];
  var storyList = [
    StoryListItem(isVisibleAdd: true),
    StoryListItem(),
    StoryListItem(),
    StoryListItem(),
    StoryListItem(),
    StoryListItem(),
    StoryListItem(),
    StoryListItem(),
  ];

  @override
  Widget build(BuildContext context) {
    posts = [
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
        context: context,
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
        context: context,
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
        context: context,
      ),
    ];
    return Scaffold(
      appBar: AppBarWidget(
        title: "Home",
        backButtonVisibility: false,
        isShowNotificationIcon: true,
        isShowMessagesIcon: true,
      ),
      body: PageWidget(child: _buildContent()),
      bottomNavigationBar: BottomNavBar(selected: -2, context: context),
    );
  }

  _buildContent() {
    return Container(
      color: kBorderColor.withOpacity(0.5),
      child: _buildPostView(),
    );
  }

  _buildPostView() {
    return Column(
      children: [
        StoryList(list: storyList),
        SizedBox(height: 5),
        ListView.builder(
          padding: EdgeInsets.all(0),
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return posts.elementAt(index);
          },
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
