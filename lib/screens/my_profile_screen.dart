import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/app_bar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
  final List<Map> myImages =
      List.generate(20, (index) => {"id": index, "name": "$index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("My Profile", uploadTap: () {}, onTap: () {}),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          color: kMainAppbarColor,
          height: 30,
          width: double.infinity,
        ),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: _buildContent(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildProfileHeader(),
        SizedBox(height: 5),
        _buildProfileContent(),
        SizedBox(height: 20),
        _buildProfileActions(),
        SizedBox(height: 10),
        _buildPosts(),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      height: 175,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(0),
            height: 125,
            width: double.infinity,
            decoration: kProfileHeaderDecoration,
          ),
          Positioned(
            bottom: 0,
            left: 35,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: buildAvatar(
                borderColor: Colors.white.withOpacity(1),
                img: "",
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Column(
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
                ),
              ),
              _buildProfileFollowersText(text: "Followers", count: "210"),
              _buildProfileFollowersText(text: "Following", count: "120"),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in velit ultrices",
            style: kBioTextStyle,
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
            Route route = MaterialPageRoute(builder: (_) => EditProfileScreen());
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
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            Text(
              count,
              style: kFollowersCountSizeTextStyle,
            ),
            Text(
              text,
              style: kFollowersCountTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (MediaQuery.of(context).size.width / 3) ,
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
}
