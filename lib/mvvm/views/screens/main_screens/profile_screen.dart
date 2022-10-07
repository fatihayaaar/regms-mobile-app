import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/mvvm/models/comment/comment.dart';
import 'package:regms_flutter_client/mvvm/models/post/post.dart';
import 'package:regms_flutter_client/mvvm/models/profile/profile.dart';
import 'package:regms_flutter_client/mvvm/models/user/user.dart';
import 'package:regms_flutter_client/mvvm/view_models/profile_view_model.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/appbar/appbar_profile.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/cards/post_card.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/cards/profile_card.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/drawer/settings_drawer.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/page.dart';
import 'package:regms_flutter_client/mvvm/views/widgets/selection_widget.dart';

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
            PostCard(
              isCommentVisible: false,
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
            ),
            PostCard(
              isCommentVisible: false,
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
              isCommentVisible: false,
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
    return _buildPosts();
  }

  _buildPosts() {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: Container(
        color: kBorderColor.withOpacity(0.3),
        child: ListView(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            _buildPostView(),
          ],
        ),
      ),
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
            return value.posts.elementAt(index);
          },
        );
      },
    );
  }
}
