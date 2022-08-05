import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/silver_app_bar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
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
            return _buildPostItem(index);
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

  Widget _buildPostItem(index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Divider(color: kBorderColor, height: 1,),
          SizedBox(height: 5),
          Row(
            children: [
              _buildPostAvatar(),
              SizedBox(width: 7),
              Text(
                "fayar",
                style: kPostUsernameTextStyle,
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.fromLTRB(7, 0, 7, 7),
            child: Text(
              "Flutter solves this by providing the AspectRatio widget You give it an AspectRatio, a child, and, well, that’s it.",
              style: kPostContentTextStyle,
            ),
          ),
          AspectRatio(
            aspectRatio: 1080 / 800,
            child: Container(
              color: Colors.amber,
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 7, 0, 7),
                  child: Row(
                    children: [
                      Text(
                        "1920 Likes",
                        style: kPostCountTextStyle,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "190 Comment",
                        style: kPostCountTextStyle,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildPostAvatar() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "assets/images/dump_1.jpg",
        size: 20,
      ),
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
