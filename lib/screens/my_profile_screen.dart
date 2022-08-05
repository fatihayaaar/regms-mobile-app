import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/silver_app_bar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/post_card.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'G'];

  var _listViewScroll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      endDrawer: buildDrawer(context: context),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          if (overScroll.depth.toString() == "0" && !overScroll.leading) {
            setState(() {
              _listViewScroll = true;
            });
          }
          if (overScroll.depth.toString() == "2" && overScroll.leading) {
            setState(() {
              _listViewScroll = false;
            });
          }
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: _buildContent(),
        ),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          buildSilverApp(_buildProfileHeader(), "My Profile"),
        ];
      },
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildProfileContent(),
        SizedBox(height: 20),
        _buildPostsTab(),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return FlexibleSpaceBar(
      background: Container(
        margin: EdgeInsets.fromLTRB(
            0, 55 + MediaQuery.of(context).viewPadding.top, 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Image.asset(
            "assets/images/dump_2.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              Expanded(child: Container()),
              _buildProfileActions(),
            ],
          ),
          SizedBox(width: 10),
          _buildUsernameAndFirstName(),
          SizedBox(height: 10),
          _buildBio(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileFollowersText(text: "Followers", count: "9.2M"),
              SizedBox(width: 15),
              _buildProfileFollowersText(text: "Following", count: "1"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActions() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          _buildProfileEditButton("Friends", () {}),
          SizedBox(width: 10),
          _buildProfileEditButton("Edit", () {
            Route route =
                MaterialPageRoute(builder: (_) => EditProfileScreen());
            Navigator.push(context, route);
          }),
        ],
      ),
    );
  }

  Widget _buildProfileEditButton(String text, void onClick()) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 33,
      width: 85,
      child: ElevatedButton(
        style: kProfileButtonButtonStyle,
        onPressed: onClick,
        child: Text(
          text,
          style: kProfileButtonContentTextStyle,
        ),
      ),
    );
  }

  Widget _buildProfileFollowersText(
      {required String text, required String count}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Text(
            count,
            style: kFollowersCountSizeTextStyle,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: kFollowersCountTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildPosts() {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          physics: _listViewScroll
              ? ScrollPhysics()
              : NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              username: "fayar",
              contentText: "You want the widget to be this wide irrespective of the actual dimensions or you want it to be that slim or exactly square.",
              likeCount: "920",
              commentCount: "10",
            );
          }),
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "assets/images/dump_1.jpg",
        size: 35,
      ),
    );
  }

  _buildUsernameAndFirstName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fatih Ayar",
          style: kNameAndSurnameTextStyle,
        ),
        Text(
          "fayar",
          style: kUsernameTextStyle,
        ),
      ],
    );
  }

  _buildBio() {
    return Text(
      "Software Developer ;) fayardev founder",
      style: kBioTextStyle,
    );
  }

  _buildPostsTab() {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: DefaultTabController(
        length: 3,
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top -
              110,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(40, 40),
              child: Container(
                height: 40,
                child: TabBar(
                  indicatorColor: kAppbarColor,
                  padding: EdgeInsets.zero,
                  tabs: [
                    _buildPostsHeaderItem(svg: messages),
                    _buildPostsHeaderItem(svg: search),
                    _buildPostsHeaderItem(svg: heart),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                _buildPosts(),
                _buildPosts(),
                _buildPosts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPostsHeaderItem({required Widget svg}) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      child: svg,
    );
  }
}
