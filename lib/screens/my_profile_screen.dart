import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/app_bar/app_bar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
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
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      height: 210,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
                bottom: Radius.circular(15),
              ),
            ),
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
}
