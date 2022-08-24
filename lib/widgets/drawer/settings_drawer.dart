import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/settings/account_setting_screen.dart';
import 'package:regms_flutter_client/screens/settings/notification_setting_screen.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_settings.dart';
import 'package:regms_flutter_client/widgets/search.dart';

Widget buildDrawer({required context}) {
  return Drawer(
    width: double.infinity,
    child: Scaffold(
      appBar: AppBarSettings(title: "Settings"),
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
              Search(),
              SizedBox(height: 20),
              buildDrawerListItem(context, "Account", AccountSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Notifications", NotificationSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Appearance", AccountSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Privacy & Security", AccountSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(
                  context, "Help and Support", AccountSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(context, "About", AccountSettingsScreen()),
              Divider(color: kBorderColor),
              buildDrawerListItem(context, "Log-out", AccountSettingsScreen()),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildDrawerListItem(context, String text, Widget page) {
  return GestureDetector(
    onTap: () {
      Route route = MaterialPageRoute(builder: (_) => page);
      Navigator.push(context, route);
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          Expanded(child: Text(text, style: kListTextStyle)),
          Icon(
            Icons.arrow_forward_ios,
            color: kBodyTextColor,
            size: 16,
          ),
        ],
      ),
    ),
  );
}

Widget buildDrawerHeader({required context, required title}) {
  return Container(
    height: 60,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kListTitleTextStyle,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: kAppbarColor,
              size: 25,
            ),
          ),
        ),
      ],
    ),
  );
}
