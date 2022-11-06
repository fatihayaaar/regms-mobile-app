import 'package:flutter/material.dart';

import '../../../models/user/user_list_item.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../../../widgets/tiles/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notifications';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSettings(title: "Notifications"),
      body: _build(),
    );
  }

  Widget _build() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: _buildNotifications(),
        ),
      ),
    );
  }

  _buildNotifications() {
    return ListView.builder(
      itemCount: 25,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return NotificationTile(
          user: UserListItem(
            username: 'deneme',
            avatar: "assets/images/dump_1.jpg",
          ),
        );
      },
    );
  }
}
