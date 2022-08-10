import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/screens/settings/change_email_screen.dart';
import 'package:regms_flutter_client/screens/settings/change_password_screen.dart';
import 'package:regms_flutter_client/screens/settings/change_username_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreen createState() => _AccountSettingsScreen();
}

class _AccountSettingsScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(),
      body: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: double.infinity,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              buildDrawerHeader(context: context, title: "Account Settings"),
              SizedBox(height: 10),
              buildDrawerListItem(
                  context, "Change Username", ChangeUsernameScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Change Email Address", ChangeEmailScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Change Password", ChangePasswordScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
