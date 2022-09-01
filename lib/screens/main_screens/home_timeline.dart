import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/selection_widget.dart';
import 'package:regms_flutter_client/widgets/story_list.dart';

class HomeTimeline extends StatelessWidget {
  final storyList;
  final posts;
  final onClickMessages;
  final list = [
    "Timeline",
    "Groups",
  ];

  HomeTimeline(
      {required this.storyList, required this.posts, this.onClickMessages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Home",
        backButtonVisibility: false,
        isShowNotificationIcon: true,
        isShowMessagesIcon: true,
        onClickMessages: onClickMessages,
      ),
      body: PageWidget(child: _buildContent()),
      bottomNavigationBar: BottomNavBar(selected: -2, context: context),
    );
  }

  _buildContent() {
    return Container(
      color: kBorderColor.withOpacity(0.3),
      child: _buildPostView(),
    );
  }

  _buildPostView() {
    return Column(
      children: [
        StoryList(list: storyList),
        Column(
          children: [
            Container(
              color: kThemeColor,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 5),
              child: SelectionWidget(list: list),
            ),
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
      ],
    );
  }
}
