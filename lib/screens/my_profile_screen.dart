import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/app_bar/app_bar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(uploadTap: () {}, onTap: () {}),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(
        selected: -2
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: kThemeColor,
      height: 30,
      width: double.infinity,
      child: NotificationListener<OverscrollIndicatorNotification>(
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
    );
  }

  Widget _buildContent() {
    return Container();
  }
}