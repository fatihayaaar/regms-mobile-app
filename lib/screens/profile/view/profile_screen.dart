import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../models/comment/comment.dart';
import '../../../models/post/post.dart';
import '../../../models/profile/profile.dart';
import '../../../models/user/user.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../widgets/appbar/appbar_profile.dart';
import '../../../widgets/bottom_navbar.dart';
import '../../../widgets/cards/post_card.dart';
import '../../../widgets/cards/profile_card.dart';
import '../../../widgets/drawer/settings_drawer.dart';
import '../../../widgets/page.dart';
import '../../../widgets/selection_widget.dart';
import '../viewmodel/profile_view_model.dart';

class ProfileScreen extends BaseStatelessWidget {
  final user;
  final isMyProfile;
  var posts = [
    Post(
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
    Post(
      user: User(
        username: "fayar",
        profile: Profile(avatar: "assets/images/dump_1.jpg"),
      ),
      likeCount: 920,
      commentCount: 0,
      sendDate: "3s",
      media: "assets/images/dump_2.jpg",
    ),
    Post(
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
  ];

  ProfileScreen({
    super.key,
    this.user,
    this.isMyProfile,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(
        user: user,
        isMyProfile: isMyProfile,
        posts: posts,
      ),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ProfileViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return _buildBody();
          },
        );
      },
    );
  }

  Widget _buildBody() => DefaultTabController(
        length: 3,
        child: Consumer<ProfileViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return Scaffold(
              appBar: ProfileAppBar(title: value.user.username),
              body: child,
              endDrawer: const MyDrawer(),
              bottomNavigationBar: const BottomNavBar(selected: -2),
            );
          },
          child: PageWidget(
              child: Column(
            children: [
              _buildProfileContent(context),
              Consumer<ProfileViewModel>(
                builder: (BuildContext context, value, Widget? child) {
                  return SelectionWidget(list: value.selectList);
                },
              ),
              const SizedBox(height: 5),
              _buildContent(),
            ],
          )),
        ),
      );

  Widget _buildProfileContent(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        alignment: Alignment.centerLeft,
        child: Consumer<ProfileViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return ProfileCard(
              user: value.user,
              context: context,
            );
          },
        ),
      );

  Widget _buildContent() => Container(
        color: ColorSchemeLight.kBorderColor.withOpacity(0.3),
        child: _buildPostView(),
      );

  Widget _buildPostView() => Consumer<ProfileViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ChangeNotifierProvider.value(
                value: value.posts.elementAt(index),
                child: Consumer<Post>(
                  builder: (BuildContext context, post, Widget? child) {
                    return PostCard(
                      isCommentVisible: false,
                      post: post,
                    );
                  },
                ),
              );
            },
          );
        },
      );
}
