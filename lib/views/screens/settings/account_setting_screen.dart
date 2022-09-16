import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/views/screens/settings/change_email_screen.dart';
import 'package:regms_flutter_client/views/screens/settings/change_password_screen.dart';
import 'package:regms_flutter_client/views/screens/settings/change_username_screen.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_settings.dart';
import 'package:regms_flutter_client/views/widgets/drawer/drawer_list_item.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreen createState() => _AccountSettingsScreen();
}

class _AccountSettingsScreen extends State {
  @override
  Widget build(BuildContext context) {
    return _buildDrawer();
  }

  Widget _buildDrawer() {
    return Drawer(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBarSettings(title: "Account Settings"),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 10),
                DrawerListItem(
                  text: "Change Username",
                  page: ChangeUsernameScreen(),
                ),
                Divider(color: kBorderColor),
                DrawerListItem(
                  text: "Change Email Address",
                  page: ChangeEmailScreen(),
                ),
                Divider(color: kBorderColor),
                DrawerListItem(
                  text: "Change Password",
                  page: ChangePasswordScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}