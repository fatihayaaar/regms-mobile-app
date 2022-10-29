import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/user/user_list_item.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_settings.dart';
import 'package:regms_flutter_client/widgets/tiles/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notifications';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettings(title: "Notifications"),
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
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: _buildNotifications(),
        ),
      ),
    );
  }

  _buildNotifications() {
    return ListView.builder(
      itemCount: 25,
      physics: NeverScrollableScrollPhysics(),
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
