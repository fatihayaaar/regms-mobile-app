import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../models/post/post.dart';
import '../../../models/profile/profile.dart';
import '../../../models/user/user.dart';
import '../../../widgets/appbar/appbar_transparent.dart';
import '../../../widgets/bottom_navbar.dart';
import '../../../widgets/cards/video_full_screen_card.dart';
import '../viewmodel/videos_view_model.dart';

class VideosScreen extends BaseStatelessWidget {
  var currentPost;
  var _pageViewController = PageController(initialPage: 0);
  var posts = [
    VideoFullScreenCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 920,
        commentCount: 10,
        text: "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        media: "assets/videos/dump_video_1.mp4",
      ),
    ),
    VideoFullScreenCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 920,
        commentCount: 0,
        sendDate: "3s",
        media: "assets/videos/dump_video_2.mp4",
      ),
    ),
    VideoFullScreenCard(
      post: Post(
        user: User(
          username: "fayar",
          profile: Profile(avatar: "assets/images/dump_1.jpg"),
        ),
        likeCount: 9220,
        commentCount: 0,
        text: "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
        sendDate: "3s",
        media: "assets/videos/dump_video_1.mp4",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<VideosViewModel>(
      viewModel: VideosViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<VideosViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
              bottomNavigationBar: BottomNavBar(
                selected: -2,
                onPressed: () {
                  for (var post in posts) {
                    if (post.controller != null) {
                      post.controller.pause();
                    }
                  }
                },
              ),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBarTransparent();

  Widget _buildBody() => Stack(
        children: [
          PageView.builder(
            controller: _pageViewController,
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return posts[index];
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildHeaderBar(),
          ),
        ],
      );

  Widget _buildHeaderBar() => Container(
        height: 45,
        alignment: Alignment.centerLeft,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _buildTitle("Videos"),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _buildAddAction(),
            ),
          ],
        ),
      );

  Widget _buildTitle(String title) => Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      );

  Widget _buildAddAction() => Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        child: const Icon(
          Icons.add_circle_outline_sharp,
          color: Colors.white,
        ),
      );
}
