import 'package:flutter/material.dart';

import '../../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/bottom_navbar.dart';
import '../../../../../widgets/page.dart';
import '../../../../../widgets/selection_widget.dart';
import '../../../../../widgets/story_list.dart';

class HomeTimeline extends StatelessWidget {
  final storyList;
  final posts;
  final onClickMessages;
  final onClickStoryAdd;
  final list = [
    "Timeline",
    "Groups",
  ];

  HomeTimeline({
    required this.storyList,
    required this.posts,
    this.onClickMessages,
    this.onClickStoryAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        backButtonVisibility: false,
        isShowNotificationIcon: true,
        isShowMessagesIcon: true,
        onClickMessages: onClickMessages,
      ),
      body: PageWidget(child: _buildContent(context)),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildContent(context) {
    return Container(
      color: ColorSchemeLight.kBorderColor.withOpacity(0.3),
      child: _buildPostView(context),
    );
  }

  _buildPostView(context) {
    return Column(
      children: [
        StoryList(
          list: storyList,
          onClickAddStory: onClickStoryAdd,
        ),
        Column(
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
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
