import 'package:flutter/material.dart';

import '../../../models/comment/comment.dart';
import '../../../models/post/post.dart';
import '../../../models/profile/profile.dart';
import '../../../models/story/story_list_item.dart';
import '../../../models/user/user.dart';
import 'pages/view/home_timeline.dart';
import 'pages/view/messages_screen.dart';
import 'pages/view/story_camera_screen.dart';
import '../../../widgets/cards/post_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final _pageViewController = PageController(initialPage: 1);
  List<PostCard> posts = [
    PostCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 920,
        commentCount: 10,
        text: "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          text: "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
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
        text: "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        comment: Comment(
          user: User(
            username: "fayar",
            profile: Profile(avatar: "assets/images/dump_1.jpg"),
          ),
          text: "Any an immutable class add after it final to next line of flutter code, this will solve your problem",
          sendTime: "10sn",
        ),
      ),
    ),
  ];
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
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: PageView(
        controller: _pageViewController,
        children: [
          StoryCameraScreen(
            onClickBackPage: () {
              _pageChange(1);
            },
          ),
          HomeTimeline(
            storyList: storyList,
            posts: posts,
            onClickMessages: () {
              _pageChange(2);
            },
            onClickStoryAdd: () {
              _pageChange(0);
            },
          ),
          MessagesScreen(
            onClickBackPage: () {
              _pageChange(1);
            },
          ),
        ],
      ),
    );
  }

  _pageChange(index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
