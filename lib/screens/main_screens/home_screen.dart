import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/story_list_item.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/screens/main_screens/home_timeline.dart';
import 'package:regms_flutter_client/screens/main_screens/messages_screen.dart';
import 'package:regms_flutter_client/screens/main_screens/story_camera_screen.dart';
import 'package:regms_flutter_client/widgets/cards/post_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  var _pageViewController = PageController(initialPage: 1);

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

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: PageView(
        controller: _pageViewController,
        children: [
          StoryCameraScreen(),
          HomeTimeline(
            storyList: storyList,
            posts: posts,
            onClickMessages: () {
              _pageViewController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          MessagesScreen(),
        ],
      ),
    );
  }
}
