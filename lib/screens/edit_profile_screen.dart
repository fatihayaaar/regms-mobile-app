import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/app_bar/title_appbar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(
        "Edit Profile",
        backToTap: () {
          Navigator.pop(context);
        },
        onTap: () {},
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: kThemeColor,
      width: double.infinity,
      child: NotificationListener<OverscrollIndicatorNotification>(
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
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: kAppbarColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildAvatarEdit(),
              SizedBox(height: 40),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              color: kAppbarColor,
              height: 30,
              width: double.infinity,
            ),
            _buildForm(),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarEdit() {
    return Container(
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
              child: buildAvatar(
                  borderColor: Colors.white.withOpacity(0), img: "", size: 80)),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: _buildFormContent(),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Column(
      children: [
        SizedBox(height: 40),
      ],
    );
  }
}
