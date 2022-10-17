import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user/user.dart';
import 'package:regms_flutter_client/view_models/profile_view_model.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar_profile.dart';
import 'package:regms_flutter_client/view/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/view/widgets/cards/post_card.dart';
import 'package:regms_flutter_client/view/widgets/cards/profile_card.dart';
import 'package:regms_flutter_client/view/widgets/drawer/settings_drawer.dart';
import 'package:regms_flutter_client/view/widgets/page.dart';
import 'package:regms_flutter_client/view/widgets/selection_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  final user;
  final isMyProfile;

  ProfileScreen({this.user, this.isMyProfile});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProfileViewModel(
          [
            Post(
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
          ],
          user,
          isMyProfile,
        );
      },
      child: DefaultTabController(
        length: 3,
        child: Consumer<ProfileViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return Scaffold(
              appBar: ProfileAppBar(title: value.user.username),
              body: child,
              endDrawer: MyDrawer(),
              bottomNavigationBar: BottomNavBar(selected: -2),
            );
          },
          child: PageWidget(child: _buildBody(context)),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildProfileContent(context),
        Consumer<ProfileViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return SelectionWidget(list: value.selectList);
          },
        ),
        SizedBox(height: 5),
        _buildContent(),
      ],
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return Container(
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
  }

  _buildContent() {
    return Container(
      color: kBorderColor.withOpacity(0.3),
      child: _buildPostView(),
    );
  }

  _buildPostView() {
    return Consumer<ProfileViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return ListView.builder(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
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
}