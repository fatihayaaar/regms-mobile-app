import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreen createState() => _AccountSettingsScreen();
}

class _AccountSettingsScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            buildDrawerHeader(context: context, title: "Account Settings"),
            SizedBox(height: 10),
            buildDrawerListItem(
                context, "Change Username", AccountSettingsScreen()),
            Divider(color: kBorderColor),
            buildDrawerListItem(
                context, "Change Email Address", AccountSettingsScreen()),
            Divider(color: kBorderColor),
            buildDrawerListItem(
                context, "Change Password", AccountSettingsScreen()),
          ],
        ),
      ),
    );
  }
}
