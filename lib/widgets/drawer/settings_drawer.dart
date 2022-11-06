import 'package:flutter/material.dart';

import '../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../screens/settings/view/account_setting_screen.dart';
import '../../screens/settings/view/notification_setting_screen.dart';
import '../appbar/appbar_settings.dart';
import '../search.dart';
import 'drawer_list_item.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Scaffold(
        appBar: const AppBarSettings(title: "Settings"),
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
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10),
          // ignore: prefer_const_constructors
          Search(),
          const SizedBox(height: 20),
          DrawerListItem(
            text: "Account",
            page: AccountSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "Notifications",
            page: NotificationSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "Appearance",
            page: AccountSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "Privacy & Security",
            page: AccountSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "Help and Support",
            page: AccountSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "About",
            page: AccountSettingsScreen(),
          ),
          const Divider(color: ColorSchemeLight.kBorderColor),
          DrawerListItem(
            text: "Log-out",
            page: AccountSettingsScreen(),
          ),
        ],
      ),
    );
  }
}
