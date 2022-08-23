import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/comment.dart';
import 'package:regms_flutter_client/models/post.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user.dart';
import 'package:regms_flutter_client/widgets/app_bar/silver_app_bar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/post_card.dart';
import 'package:regms_flutter_client/widgets/profile_card.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class ProfileScreen extends StatefulWidget {
  final bool? isMyProfile;
  final User user;

  ProfileScreen({required this.user, this.isMyProfile});

  @override
  _ProfileScreenState createState() => _ProfileScreenState(user, isMyProfile);
}

class _ProfileScreenState extends State {
  bool? isMyProfile;
  User user;

  String _selectedTag = "All";
  var items = [
    'All',
    'Photos',
    'Videos',
    'Text',
  ];

  List<PostCard> posts = [];

  _ProfileScreenState(this.user, this.isMyProfile);

  @override
  Widget build(BuildContext context) {
    posts = [
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
        context: context,
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
        context: context,
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
        context: context,
      ),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _buildBody(),
        endDrawer: buildDrawer(context: context),
        bottomNavigationBar: BottomNavBar(selected: -2, context: context),
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
          buildSilverApp(_buildProfileContent(), user.username, context),
        ];
      },
    );
  }

  Widget _buildProfileContent() {
    return FlexibleSpaceBar(
      background: Container(
        color: kThemeColor,
        margin: EdgeInsets.fromLTRB(
            0, 40 + MediaQuery.of(context).viewPadding.top, 0, 0),
        alignment: Alignment.centerLeft,
        child: ProfileCard(user: user, context: context),
      ),
    );
  }

  _buildContent() {
    return TabBarView(
      children: [
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
        _buildPosts(),
      ],
    );
  }

  _buildPosts() {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: Container(
        color: kBorderColor.withOpacity(0.5),
        child: ListView(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            _buildTags(),
            _buildPostView(),
          ],
        ),
      ),
    );
  }

  _buildTags() {
    return Container(
      color: kThemeColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildFilter(),
            SizedBox(width: 10),
            _buildListTag(),
          ],
        ),
      ),
    );
  }

  _buildPostView() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return posts.elementAt(index);
        },
      ),
    );
  }

  _buildListTag() {
    return Container(
      decoration: kBoxDecorationTextField,
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: SizedBox(
        height: 30,
        width: 105,
        child: DropdownButton(
          value: _selectedTag,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedTag = value!;
            });
          },
          isExpanded: true,
          underline: Container(),
          style: kLabelTextStyle,
          elevation: 1,
        ),
      ),
    );
  }

  _buildFilter() {
    return Expanded(
      child: Container(
        decoration: kFilterBoxDecorationTextField,
        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: SizedBox(
          height: 30,
          width: 105,
          child: DropdownButton(
            value: _selectedTag,
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            icon: Icon(Icons.filter_list),
            onChanged: (String? value) {
              setState(() {
                _selectedTag = value!;
              });
            },
            isExpanded: true,
            underline: Container(),
            style: kLabelTextStyle,
            elevation: 1,
          ),
        ),
      ),
    );
  }
}
