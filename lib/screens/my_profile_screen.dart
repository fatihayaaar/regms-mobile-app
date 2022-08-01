import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
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
  final List<Map> myImages =
      List.generate(0, (index) => {"id": index, "name": "$index"}).toList();

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
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: _buildContent(),
          ),
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
        _buildProfileActions(),
        SizedBox(height: 10),
        _buildPosts(),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return FlexibleSpaceBar(
      background: Container(
        margin: EdgeInsets.fromLTRB(
            0, 55 + MediaQuery.of(context).viewPadding.top, 0, 0),
        child: Expanded(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(),
              SizedBox(width: 10),
              _buildUsernameAndFirstName(),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Software Developer ;) fayardev founder",
            style: kBioTextStyle,
          ),
          SizedBox(height: 15),
          Row(
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
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        children: [
          _buildProfileEditButton("Friends", () {}),
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
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
        height: 33,
        child: ElevatedButton(
          style: kProfileButtonButtonStyle,
          onPressed: onClick,
          child: Text(
            text,
            style: kProfileButtonContentTextStyle,
          ),
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
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (MediaQuery.of(context).size.width / 3),
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: myImages.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: BoxDecoration(
              color: kBorderColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }

  _buildAvatar() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: buildAvatar(
        borderColor: Colors.white.withOpacity(1),
        img: "assets/images/dump_1.jpg",
        size: 25,
      ),
    );
  }

  _buildUsernameAndFirstName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "fayar",
          style: kUsernameTextStyle,
        ),
        Text(
          "Fatih Ayar",
          style: kNameAndSurnameTextStyle,
        ),
      ],
    );
  }
}
