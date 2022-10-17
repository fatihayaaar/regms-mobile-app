import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/view/screens/settings/view/account_setting_screen.dart';
import 'package:regms_flutter_client/view/screens/settings/view/notification_setting_screen.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar_settings.dart';
import 'package:regms_flutter_client/view/widgets/drawer/drawer_list_item.dart';
import 'package:regms_flutter_client/view/widgets/search.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBarSettings(title: "Settings"),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: _buildList(),
        ),
      ),
    );
  }

  _buildList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 10),
          Search(),
          SizedBox(height: 20),
          DrawerListItem(
            text: "Account",
            page: AccountSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "Notifications",
            page: NotificationSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "Appearance",
            page: AccountSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "Privacy & Security",
            page: AccountSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "Help and Support",
            page: AccountSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "About",
            page: AccountSettingsScreen(),
          ),
          Divider(color: kBorderColor),
          DrawerListItem(
            text: "Log-out",
            page: AccountSettingsScreen(),
          ),
        ],
      ),
    );
  }
}
